class RemoveDescriptionFromCourses < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :description, :string
  end
end
