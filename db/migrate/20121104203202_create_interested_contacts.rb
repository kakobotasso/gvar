class CreateInterestedContacts < ActiveRecord::Migration
  def change
    create_table :interested_contacts do |t|
      t.string :date
      t.text :description
      t.integer :interested_id

      t.timestamps
    end
  end
end
