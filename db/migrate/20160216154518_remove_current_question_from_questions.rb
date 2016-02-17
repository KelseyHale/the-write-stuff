class RemoveCurrentQuestionFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :current_question, :boolean
  end
end
