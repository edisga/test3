class AddVideoToElements < ActiveRecord::Migration[6.0]
  def change
    add_column :elements, :video, :string
  end
end
