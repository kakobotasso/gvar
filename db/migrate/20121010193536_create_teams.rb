class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :code
      t.string :name
      t.integer :course_id
      t.integer :season
      t.integer :limit
      t.integer :class_length
      t.string :workload
      t.text :note
	  t.boolean :active, :default => true

      t.timestamps
    end
  end
end
