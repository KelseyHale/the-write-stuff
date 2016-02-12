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
