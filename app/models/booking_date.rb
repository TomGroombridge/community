class BookingDate < ActiveRecord::Base
	belongs_to :booking
	belongs_to :course_date
	after_create :send_reminder

	def send_reminder
		@booking_date = self
		BookingMailer.delay_until(@booking_date.course_date.start_date_time - 1.days).date_reminder(@booking_date.id)
	end


end
