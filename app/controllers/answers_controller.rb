class AnswersController < ApplicationController
  def index
    @current_question = Question.find_by(current_question: true)
    @answers = Answer.where(question: @current_question)
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find_by(current_question: true)
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Question answered"
      redirect_to answers_path
    else
      flash[:error] = @answer.errors.full_messages.join(". ")
      @current_question = Question.find_by(current_question: true)
      render "users/index"
    end
  end


  protected

  def answer_params
    params.require(:answer).permit(:answer_content, :user, :question)
  end
end
