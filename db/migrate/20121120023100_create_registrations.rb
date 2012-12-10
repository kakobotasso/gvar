class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :code
      t.integer :team_id
      t.integer :student_id
      t.integer :release_id
      t.integer :status, :default => 0

      t.timestamps
    end

    add_index :registrations, :code
    add_index :registrations, :team_id
    add_index :registrations, :student_id
    add_index :registrations, :release_id
    add_index :registrations, :updated_at
  end
end
