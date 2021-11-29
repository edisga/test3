class AddPriceToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :price, :float
    add_column :courses, :abbreviation, :string
  end
end
