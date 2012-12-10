class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.date :date
      t.integer :team_id

      t.timestamps
    end
    add_index :meetings, :date
    add_index :meetings, :team_id
    add_index :meetings, :updated_at
  end
end
