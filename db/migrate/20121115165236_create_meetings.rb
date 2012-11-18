class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.date :date
      t.integer :team_id

      t.timestamps
    end
  end
end
