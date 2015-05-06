class AddTicketFeeToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :ticket_fee, :decimal, :default => 0.00
  end
end
