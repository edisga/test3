class AddOrderToModules < ActiveRecord::Migration[6.0]
  def change
    add_column :moduls, :order, :integer
  end
end
