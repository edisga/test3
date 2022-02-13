class AddIconToFeatures < ActiveRecord::Migration[6.0]
  def change
    add_column :features, :icon, :string
  end
end
