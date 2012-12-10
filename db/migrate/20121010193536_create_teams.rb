class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string  :code
      t.string  :name
      t.integer :course_id
      t.integer :season
      t.integer :limit
      t.decimal :price
      t.integer :class_length
      t.string  :workload
      t.text    :note
      t.integer :status

      t.timestamps
    end

    add_index :teams, :code
    add_index :teams, :course_id
    add_index :teams, :season
    add_index :teams, :updated_at
  end
end
