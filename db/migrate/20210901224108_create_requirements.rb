class CreateRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :requirements do |t|
      t.string :title
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
