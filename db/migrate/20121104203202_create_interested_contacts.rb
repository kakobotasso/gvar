class CreateInterestedContacts < ActiveRecord::Migration
  def change
    create_table :interested_contacts do |t|
      t.string :date
      t.text :description
      t.integer :interested_id

      t.timestamps
    end

    add_index :interested_contacts, :date
    add_index :interested_contacts, :interested_id
    add_index :interested_contacts, :updated_at
  end
end
