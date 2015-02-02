class CourseDate < ActiveRecord::Base
	belongs_to :course
	has_many :payments	
	after_create :invalid
	



	def valid_dates(course)			
		if course.dates > Time.now && course.active?				
			course
		end		
	end	

	def invalid		
		self.delay_until(self.dates - 24.hours).update_attributes(active: false)
	end

	def pretty_date
		dates.strftime("%m/%d/%Y/%I:%M%p")
	end

end
