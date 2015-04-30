class ChangeTicketPriceToBigDecimal < ActiveRecord::Migration
  def up
	  change_column :tickets, :price, :decimal, :default => 0.00
	end

	def down
	  change_column :tickets, :price, :float
	end
end
