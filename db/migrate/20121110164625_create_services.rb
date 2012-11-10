class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string  :name
      t.integer :number_days
      t.string  :estimated_time
      t.decimal :default_value
      t.boolean :inactive
      t.text    :description

      t.timestamps
    end
  end
end
