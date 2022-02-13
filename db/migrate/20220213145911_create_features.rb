class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.string :description
      t.references :course

      t.timestamps
    end
  end
end
