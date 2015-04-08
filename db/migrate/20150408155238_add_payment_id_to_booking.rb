class AddPaymentIdToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :payment_id, :integer
  end
end
