class AddAmountPaidToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :amount_paid, :decimal, :default => 0.00
  end
end
