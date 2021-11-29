class CreatePaidCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :paid_courses do |t|
      t.boolean :paid
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
