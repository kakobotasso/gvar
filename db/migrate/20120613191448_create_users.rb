class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :login
      t.string :password_hash
      t.string :password_salt
      t.string :name
      t.string :email

      t.timestamps
    end

    add_index :users, :login
    add_index :users, :email
    add_index :users, :updated_at
  end

  def down
    drop_table :users
  end
end
