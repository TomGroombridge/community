class Booking < ActiveRecord::Base
	belongs_to :order
	belongs_to :payment
	has_many :booking_dates
	accepts_nested_attributes_for :booking_dates
	after_create :send_reminder

	def send_reminder
		@booking = self
		@course_date = self.payment.ticket.course_date.start_date_time
		PaymentMailer.delay_until(@course_date - 1.days).reminder(@booking.id)
		# PaymentMailer.delay_for(10.seconds).reminder(self)#
	end

	def self.search(search)
	  where("email LIKE ?", "%#{search}%")
	end

end
