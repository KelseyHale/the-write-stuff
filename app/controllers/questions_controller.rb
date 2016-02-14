class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    #find question by params and answer by question
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end
end
