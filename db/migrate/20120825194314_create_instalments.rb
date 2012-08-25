class CreateInstalments < ActiveRecord::Migration
  def change
    create_table :instalments do |t|
      t.integer :release_id
      t.integer :number
      t.string :name
      t.datetime :expiration_date
      t.integer :status
      t.decimal :price
      t.integer :payment

      t.timestamps
    end
  end
end
