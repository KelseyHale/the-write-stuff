class UsersController < ApplicationController
  def index
    @current_question = Question.find_by(current_question: true)
    @answer = Answer.new
    @answers = Answer.where(question: @current_question)
  end
end
