class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :users, through: :answers

  def self.set_question_of_the_day
    self.where(current_question: true).update_all(current_question: false, fresh: false)
    if self.where(fresh: true) != []
      self.new_question
    else
      self.update_all(current_question: false, fresh: true)
      self.new_question
    end
  end

  def self.new_question
    new_question = self.where(fresh: true).first
    new_question.update!(current_question: true)
    new_question.question
  end
end
