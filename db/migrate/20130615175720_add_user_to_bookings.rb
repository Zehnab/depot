class AddUserToBookings < ActiveRecord::Migration
  def change
     add_column :bookings, :user_id, :integer, references: :users 
  end
end
