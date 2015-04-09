class CreateBookingDates < ActiveRecord::Migration
  def change
    create_table :booking_dates do |t|
      t.integer :booking_id
      t.integer :course_date_id

      t.timestamps
    end
  end
end
