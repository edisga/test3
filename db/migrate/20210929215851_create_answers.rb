class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :anser
      t.boolean :correct_answer
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
