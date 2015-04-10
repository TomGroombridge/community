class RemoveFeaturesFromPayment < ActiveRecord::Migration
  def change
  	remove_column :payments, :course_id, :integer
  	remove_column :payments, :email, :string
  	remove_column :payments, :full_name, :string
  	remove_column :payments, :mobile_number, :string
  	remove_column :payments, :special_request, :text
  	remove_column :payments, :quantity, :integer
  	remove_column :payments, :entry_id, :integer
  end
end
