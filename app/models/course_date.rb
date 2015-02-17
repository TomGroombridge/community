class CourseDate < ActiveRecord::Base
	belongs_to :course
	has_many :payments	
	after_create :invalid
	after_create :send_course_info

	def send_course_info
		CourseDateMailer.delay_until(self.start_date - 24.hours).course_info(self)		
	end

	def valid_dates(course)			
		if course.start_date > Time.now && course.active?				
			course
		end		
	end	

	def invalid		
		self.delay_until(self.start_date - 24.hours).update_attributes(active: false)
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

	def start_date_time		
		@time = DateTime.parse("#{self.start_date} #{self.start_time}:00")					
	end

	# def edit_course_date
	# 	start_date - 24.hours
	# end

end
