require 'rails_helper'

feature 'user views dashboard', %Q{
  As a registered user
  I want to view my dashboard
  So that I can answer my daily question
} do
  scenario 'user sees current daily question (has not previously answered)' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    current_question = FactoryGirl.create(:question)
    FactoryGirl.create(:answer, user: user2, question: current_question)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Current question:')
    expect(page).to have_content(current_question.question)
    expect(page).to have_selector("#answer-question")

  end

  scenario 'dashboard immediately following answering a question' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    current_question = FactoryGirl.create(:question)
    next_question = FactoryGirl.create(:question)
    answer = FactoryGirl.create(:answer, user: user2, question: current_question)


    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    fill_in "answer[answer_content]", with: "This is the answer to your questionnnnn"
    click_button 'Submit Answer'

    visit "/"

    expect(page).not_to have_content('Question answered')
    expect(page).to have_selector("#answer-question")
    expect(page).not_to have_selector("#all-answers")
    expect(page).not_to have_content(answer.answer_content)
    expect(page).to have_content(next_question.question)

  end
end
