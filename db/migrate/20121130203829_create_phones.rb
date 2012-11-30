class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :type_number
      t.string  :number
      t.integer :person_id

      t.timestamps
    end
  end
end
