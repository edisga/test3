class CreateModuls < ActiveRecord::Migration[6.0]
  def change
    create_table :moduls do |t|
      t.string :title
      t.string :download_document
      t.string :description
      t.references :course

      t.timestamps
    end
  end
end
