class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :order_id
      t.string :name
      t.string :email
      t.string :contact_number

      t.timestamps
    end
  end
end
