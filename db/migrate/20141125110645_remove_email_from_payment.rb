class RemoveEmailFromPayment < ActiveRecord::Migration
  def change	
  	remove_column :payments, :email, :string
  end
end
