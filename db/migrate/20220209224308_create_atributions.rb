class CreateAtributions < ActiveRecord::Migration[6.0]
  def change
    create_table :atributions do |t|
      t.string :title
      t.text :description
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
