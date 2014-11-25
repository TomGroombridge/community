class AddUserIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :user_id, :string
    add_column :payments, :integer, :string
  end
end
