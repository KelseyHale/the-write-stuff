require 'rails_helper'

feature 'user answers question', %{Q
  As a user
  I want to answer a question
  so I can see other people's answers to the same question
} do
  scenario 'user can answer current question' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:question)
    current_question = FactoryGirl.create(:question, current_question: true)
    FactoryGirl.create(:question)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    fill_in "answer[answer_content]", with: "This is the answer to your questionnnnn"
    click_button 'Submit Answer'

    expect(page).to have_content('Question answered')
    expect(page).not_to have_selector("#answer-question")
    expect(current_question.answers).to include(Answer.find_by(answer_content: "This is the answer to your questionnnnn"))

  end
  scenario 'user tries to submit a blank answer' do
    user = FactoryGirl.create(:user)
    current_question = FactoryGirl.create(:question, current_question: true)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    fill_in "answer[answer_content]", with: ""
    click_button 'Submit Answer'
    expect(page).to have_content("Answer content can't be blank")
  end
end
