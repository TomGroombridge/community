class CourseDate < ActiveRecord::Base
	belongs_to :course
	has_many :payments
end
