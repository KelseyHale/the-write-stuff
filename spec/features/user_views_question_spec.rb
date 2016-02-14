require 'rails_helper'

# Acceptance Criteria
# [X] I can click on a question from the index page
# [X] There is a show page for a question
# [X] I can see the answers to the question on the show page

feature "As an authenticated user
I want to view the answers to a question
So that I can see everyone else's responses" do
  scenario 'unauthenticated user tries to view question details' do
    FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)

    visit questions_path
    click_link question.question
    fill_in "answer[answer_content]", with: "answer to yo question"
    click_button "Submit Answer"

    expect(page).to have_content "You need to sign in or sign up"
  end
  scenario 'User clicks on a question
  and is brought to the question show page' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, current_question: true)
    FactoryGirl.create(:question)
    FactoryGirl.create(:answer, user: user, question: question)
    FactoryGirl.create(:answer, user: user2, question: question)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    visit questions_path
    click_link question.question

    expect(page).to have_content(question.question)
    expect(page).to have_content(question.answers.first.answer_content)
  end

  scenario 'User that has not answered the question clicks on the question' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, current_question: true)
    FactoryGirl.create(:question)
    FactoryGirl.create(:answer, user: user2, question: question)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    visit questions_path
    click_link question.question

    expect(page).to have_content(question.question)
    expect(page).to have_selector("#answer-question")
    expect(page).not_to have_content(question.answers.first.answer_content)
  end
end
