class AddAgeToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :age, :integer
  end
end
