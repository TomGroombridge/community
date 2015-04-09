class AddPaymentIdToDateSelection < ActiveRecord::Migration
  def change
    add_column :date_selections, :payment_id, :integer
  end
end
