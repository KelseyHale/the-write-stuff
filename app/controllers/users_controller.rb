class UsersController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.generate_random_unanswered_question(current_user)
    @answer = Answer.new
    # @question = @current_question
    @answers = Answer.where(question: @current_question)
    # binding.pry
    # @question = Question.find(params[:id])
  end
end
