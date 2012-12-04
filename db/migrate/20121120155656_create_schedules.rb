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
  end
end
