# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.create(question: "How you doin'?", current_question: true)
Question.create(question: "Tell me about your favorite animal")
Question.create(question: "Tell me something funny that happened yesterday")
Question.create(question: "question")
Question.create(question: "bleh")
Question.create(question: "please change")
Question.create(question: "why won't this work")
Question.create(question: "nah")
Question.create(question: "okokokokokokokokokokok")

n = 0
while n < 10 do
  User.create(email: "user#{n}@email.com", password: "password", password_confirmation: "password")
  Answer.create(answer_content: "This is my answer yo #{n}", question_id: 1, user_id: n)
  Answer.create(answer_content: "Here we go again #{n}", question_id: 2, user_id: n)
  Answer.create(answer_content: "Say whaaaaa #{n}", question_id: 3, user_id: n)
  Answer.create(answer_content: "mmmmmhmmmmm #{n}", question_id: 4, user_id: n)
  Answer.create(answer_content: "giggity #{n}", question_id: 5, user_id: n)
  n += 1
end
