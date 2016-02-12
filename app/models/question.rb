class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :users, through: :answers

  def self.set_question_of_the_day
    self.where(current_question: true).update_all(current_question: false, fresh: false)
    new_question = self.where(fresh: true).order("RANDOM()").first
    new_question.update!(current_question: true)
    new_question.question
  end

  # def store_question_of_the_day(current_question)
  #   current_question
  # end
end
