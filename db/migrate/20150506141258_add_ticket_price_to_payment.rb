class AddTicketPriceToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :ticket_price, :decimal, :default => 0.00
  end
end
