require 'rails_helper'

feature 'user views dashboard', %Q{
  As a registered user
  I want to view my dashboard
  So that I can answer my daily question
} do
  scenario 'user sees current daily question (has not previously answered)' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    current_question = FactoryGirl.create(:question, current_question: true)
    FactoryGirl.create(:answer, user: user, question: current_question)
    FactoryGirl.create(:answer, user: user2, question: current_question)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Current question:')
    expect(page).to have_content(current_question.question)
  end

  scenario 'user views dashboard after answering question' do

  end

  # scenario 'specify invalid credentials' do
  #   visit new_user_session_path
  #
  #   click_button 'Log in'
  #   expect(page).to have_content('Invalid email or password')
  #   expect(page).to_not have_content('Sign Out')
  # end
end
