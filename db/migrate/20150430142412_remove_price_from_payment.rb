class RemovePriceFromPayment < ActiveRecord::Migration
  def change
  	remove_column :payments, :price, :float
  end
end
