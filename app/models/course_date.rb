class CourseDate < ActiveRecord::Base
	belongs_to :course
	has_many :payments	
	after_create :invalid
	
	def valid_dates(course)			
		if course.start_date > Time.now && course.active?				
			course
		end		
	end	

	def invalid		
		self.delay_until(self.start_date - 24.hours).update_attributes(active: false)
	end

	def pretty_date
		start_date.strftime("%m/%d/%Y/%I:%M%p")
	end

	def max_revenue
		quantity * self.course.price
	end

	def sale_percentage
		value = self.payments.count.to_f / quantity * 100.00
		value.to_i
	end

end
