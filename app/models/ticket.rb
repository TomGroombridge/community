class Ticket < ActiveRecord::Base
	belongs_to :course_date
	has_many :payments
  has_many :entries

	def free?
    price.zero?
  end

  def places_left
    places_booked = self.course_date.booking_dates.count
  	tickets = self.quantity
  	tickets - places_booked
  end

  def bookings
    payments = self.payments.count
  end

end
