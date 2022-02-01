class AddTextToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :text, :text
  end
end
