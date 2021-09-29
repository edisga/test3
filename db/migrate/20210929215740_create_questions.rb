class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :state
      t.datetime :year
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
