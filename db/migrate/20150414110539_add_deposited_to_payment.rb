class AddDepositedToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :deposited, :boolean, :default => false
  end
end
