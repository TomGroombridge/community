class CourseDate < ActiveRecord::Base
	has_many :payments
	has_many :entry_selections
	after_create :invalid
	after_create :send_course_info
	after_create :full
	belongs_to :course
  has_many :tickets
  accepts_nested_attributes_for :tickets

	def valid_dates(course)
		if course.start_date_time > Time.now && course.active?
			course
		end
	end

	# def places_left
	# 	payments = self.payments.count
	# end

	def start_date_time
		d = start_date
		t = start_time
		dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
	end

	def invalid
		self.delay_until(self.start_date_time - 24.hours).update_attributes(active: false)
	end

	def full
		@check = self.quantity == self.payments.count
		# self.delay(@check => true).update_attributes(active: false)
	end

	def send_course_info
		CourseDateMailer.delay_until(self.start_date_time - 24.hours).course_info(self)
	end

	def pretty_date
		start_date.strftime("%m/%d/%Y/") + start_time.strftime("%I:%M%p")
	end

	def max_revenue
		quantity * self.course.price
	end

	def sale_percentage
		value = self.payments.count.to_f / quantity * 100.00
		value.to_i
	end

	def send_new_date
		CourseDateMailer.new_date(self).deliver!
	end

	def max_tickets
		@tickets = []
		self.tickets.each {|ticket| @tickets <<  ticket.quantity}
		@tickets.inject(:+)
	end

	def tickets_left
		self.payments.count.to_s  + "/" + self.max_tickets.to_s
	end

	def revenue
		@ticket_ammount = []
		@revenue = []
		self.tickets.each do |ticket|
			@revenue <<  ticket.bookings * ticket.price
		end
		@revenue.inject(:+)
	end

	# def places_left
	# 	quantity - self.payments.count
	# end

	# def edit_course_date
	# 	start_date - 24.hours
	# end

end
