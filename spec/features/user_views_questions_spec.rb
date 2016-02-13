require 'rails_helper'

# Acceptance criteria
# [ ] I do not need to be logged in
# [ ] I must be on the questions index page
# [ ] I can see a list of all questions
# [ ] I can see a how many people have answered each question


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
end
