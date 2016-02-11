class UsersController < ApplicationController
  def index
    @current_question = Question.last.question unless Question.last == nil
    @answer = Answer.new
  end
end
