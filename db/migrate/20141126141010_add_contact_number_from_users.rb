class AddContactNumberFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :contact_number, :integer
  	add_column :users, :contact_number, :string
  end
end
