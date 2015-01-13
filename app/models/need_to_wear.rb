class NeedToWear < ActiveRecord::Base
belongs_to :course

	def valid_entries(course)
		if course.name != nil		
			course
		end
	end

end
