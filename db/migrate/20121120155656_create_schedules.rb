class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string   :code
      t.integer  :service_id
      t.integer  :provider_id
      t.integer  :client_id
      t.integer  :release_id
      t.string   :estimated_time
      t.integer  :number_days
      t.datetime :date
      t.text     :observations

      t.timestamps
    end

    add_index :schedules, :code
    add_index :schedules, :service_id
    add_index :schedules, :provider_id
    add_index :schedules, :client_id
    add_index :schedules, :release_id
    add_index :schedules, :date
    add_index :schedules, :updated_at
  end
end
