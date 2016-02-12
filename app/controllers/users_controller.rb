class UsersController < ApplicationController
  def index
    # binding.pry
    @current_question = Question.find_by(current_question: true).question
    @answer = Answer.new
  end
end
