class Booking < ActiveRecord::Base
	belongs_to :order
	belongs_to :payment
	has_many :booking_dates
	accepts_nested_attributes_for :booking_dates
	after_create :send_reminder

	def send_reminder
		@booking = self
		self.booking_dates.each do |date|
			PaymentMailer.delay_until(date.course_date.start_date_time - 1.days).reminder(@booking.id)
		end
	end

	def self.search(search)
	  where("email LIKE ?", "%#{search}%")
	end

end
