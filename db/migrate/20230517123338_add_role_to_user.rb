class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string, default: 'author'
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
