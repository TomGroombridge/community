class CourseDate < ActiveRecord::Base
	belongs_to :course
	has_many :payments

	def valid_dates(course)			
		if course.dates > Time.now					
			course.course.update_attributes(active: true)						
		end		
	end

end
