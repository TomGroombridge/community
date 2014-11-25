class RemoveIntergerFromPayment < ActiveRecord::Migration
  def change
  	remove_column :payments, :user_id, :string
    remove_column :payments, :integer, :string
    add_column :payments, :user_id, :integer
  end
end
