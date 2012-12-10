class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :timetable
      t.text :description
      t.integer :meeting_id

      t.timestamps
    end

    add_index :activities, :timetable
    add_index :activities, :meeting_id
    add_index :activities, :updated_at
  end
end
