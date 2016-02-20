class UsersController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.generate_random_unanswered_question(current_user)
    @answer = Answer.new
    @answers = Answer.where(question: @current_question)
  end
end
