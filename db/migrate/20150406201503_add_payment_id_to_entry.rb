class AddPaymentIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :payment_id, :integer
  end
end
