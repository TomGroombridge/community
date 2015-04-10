class Booking < ActiveRecord::Base
	belongs_to :order
	belongs_to :payment
	has_many :booking_dates
	accepts_nested_attributes_for :booking_dates
	after_create :send_reminder

	def send_reminder
		@course_date = self.payment.ticket.course_date.start_date_time
		PaymentMailer.reminder(self).deliver!
		self.payment.ticket.course_date.delay_until(@course_date - 1.days).update_attributes(active: false)
	end



end
