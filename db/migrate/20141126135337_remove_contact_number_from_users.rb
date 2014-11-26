class RemoveContactNumberFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :user_id, :integer
  	add_column :users, :contact_number, :integer
  end
end
