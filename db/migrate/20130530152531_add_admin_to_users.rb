class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default =>false
  end
  
  def self.donw
    remove_column :users, :admin
  end
  
end
