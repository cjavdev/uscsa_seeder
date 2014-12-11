class AddRoleColumsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :officer, :boolean, default: false
    add_column :users, :captain, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
  end
end
