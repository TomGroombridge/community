class AddSpecialRequestToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :special_request, :text
  end
end
