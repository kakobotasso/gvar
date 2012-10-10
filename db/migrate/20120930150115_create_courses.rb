class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.integer :course_type
      t.text :description
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
