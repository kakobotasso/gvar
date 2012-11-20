class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :timetable
      t.text :description
      t.integer :meeting_id

      t.timestamps
    end
  end
end
