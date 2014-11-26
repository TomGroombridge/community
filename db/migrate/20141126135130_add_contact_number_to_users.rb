class AddContactNumberToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :contact_number, :string
    remove_column :users, :integer, :string
    add_column :users, :user_id, :integer
  end
end
