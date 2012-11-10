class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :address
      t.integer :number
      t.string  :complement
      t.string  :zipcode
      t.integer :country
      t.string  :city
      t.string  :neighborhood

      t.timestamps
    end
  end
end
