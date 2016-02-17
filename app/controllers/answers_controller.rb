class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # @current_question = Question.find(params[:question_id])
    @answers = Answer.where(question: @current_question)
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Question answered"
      redirect_to question_path(@question)
    else
      flash[:error] = @answer.errors.full_messages.join(". ")
      @current_question = Question.find(params[:question_id])
      render "users/index"
    end
  end


  protected

  def answer_params
    params.require(:answer).permit(:answer_content, :user, :question)
  end
end
