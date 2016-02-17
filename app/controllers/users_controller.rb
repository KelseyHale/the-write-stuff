class UsersController < ApplicationController
  def index
    @current_question = Question.order("RANDOM()").first
    @answer = Answer.new
    @question = @current_question
    @answers = Answer.where(question: @current_question)
    # binding.pry
    # @question = Question.find(params[:id])
  end
end
