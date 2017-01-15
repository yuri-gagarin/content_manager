class RenameTableUsers < ActiveRecord::Migration[5.0]
  def up
  	rename_table('users', 'admin_users')
  end

  def down
  	rename_table('admin_users', 'users')
  end
end
