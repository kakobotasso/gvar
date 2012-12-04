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
  end
end
