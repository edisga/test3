class RemoveAnserFromAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :anser
    add_column :answers, :answer, :string
  end
end
