class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :address
      t.integer :number
      t.integer :person_id
      t.string  :complement
      t.string  :zipcode
      t.integer :country_id
      t.string  :city
      t.string  :neighborhood

      t.timestamps
    end
  end
end
