class AddCurrentQuestionToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :current_question, :boolean, default: false
  end
end
