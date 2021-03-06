class CreateInteresteds < ActiveRecord::Migration
  def change
    create_table :interesteds do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :situation
      t.text :interest

      t.timestamps
    end

    add_index :interesteds, :name
    add_index :interesteds, :email
    add_index :interesteds, :updated_at
  end
end
