class RemoveAtributionsAndRequirementsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :atributions
    drop_table :requirements
  end
end
