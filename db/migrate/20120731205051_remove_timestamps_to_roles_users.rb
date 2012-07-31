class RemoveTimestampsToRolesUsers < ActiveRecord::Migration
  def up
    remove_column :roles_users, :created_at
    remove_column :roles_users, :updated_at
  end

  def down
    add_column :roles_users, :created_at, :datetime
    add_column :roles_users, :updated_at, :datetime
  end
end
