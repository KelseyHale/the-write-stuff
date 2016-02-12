class AddFreshToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :fresh, :boolean, default: true
  end
end
