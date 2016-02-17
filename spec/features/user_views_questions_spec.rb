require 'rails_helper'

# Acceptance criteria
# [X] I do not need to be logged in
# [X] I must be on the questions index page
# [X] I can see a list of all questions
# [ ] I can see a how many people have answered each question
# [X] I can visit the show page by clicking a link to the question


feature 'user views questions index page', %Q{
  As a user
  I want to view a list of all questions
  So that I can decide which question to see the details of
} do
  scenario 'user visits the questions index page and sees all questions' do
    10.times do
      FactoryGirl.create(:question)
    end

    visit questions_path

    expect(page).to have_content(Question.first.question)
    expect(page).to have_content(Question.last.question)
  end
  scenario 'user clicks link to questions show page' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    FactoryGirl.create(:question)
    answer = FactoryGirl.create(:answer, user: user, question: question)
    FactoryGirl.create(:answer, user: user2, question: question)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit questions_path
    click_link question.question

    expect(page).to have_content(question.question)
    expect(page).to have_content(answer.answer_content)
  end
end
