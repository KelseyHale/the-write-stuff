class UsersController < ApplicationController
  def index
    @current_question = Question.last.question unless Question.last == nil
  end
end
