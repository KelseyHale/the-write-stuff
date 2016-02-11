class AnswersController < ApplicationController
  def index
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.last
    @answer.user = current_user
    @answer.question = @question
    # binding.pry

    if @answer.save
      flash[:notice] = "Question answered"
      redirect_to answers_path
    else
      flash[:error] = "error"
    end
  end


  protected

  def answer_params
    params.require(:answer).permit(:answer_content, :user, :question)
  end
end
