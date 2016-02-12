class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :question
  has_many :answers
  has_many :questions, through: :answers

  def has_answered_current_question?(current_question, current_user)
    current_question.users.include?(current_user)
  end
end
