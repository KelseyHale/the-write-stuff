class AnswersController < ApplicationController
  def index
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.last
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Question answered"
      redirect_to answers_path
    else
      flash[:error] = @answer.errors.full_messages.join(". ")
      render "users/index"
    end
  end


  protected

  def answer_params
    params.require(:answer).permit(:answer_content, :user, :question)
  end
end
