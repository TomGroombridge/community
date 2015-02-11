class CourseAddress < ActiveRecord::Base
	belongs_to :course
	geocoded_by :postcode
	after_validation :geocode, :if => :postcode_changed?
end
