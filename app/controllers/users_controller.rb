class UsersController < ApplicationController
  def index
    @previous_answered_questions = current_user.questions
    @question = Question.generate_random_unanswered_question(current_user)
    @answer = Answer.new
    @answers = Answer.where(question: @current_question)
  end
end
