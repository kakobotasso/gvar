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
  end

  def down
    drop_table :users
  end
end
