require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :question do
    sequence(:question) { |n| "question content #{n}" }
  end

  factory :answer do
    sequence(:answer_content) { |n| "Answer content #{n}" }
  end

end
