class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :type_number
      t.string  :number
      t.integer :person_id

      t.timestamps
    end

    add_index :phones, :person_id
    add_index :phones, :number
    add_index :phones, :updated_at
  end
end
