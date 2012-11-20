class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :team_id
      t.integer :student_id
      t.string :code
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
