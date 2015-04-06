class DateSelection < ActiveRecord::Base
	belongs_to :course_date
	belongs_to :ticket
end
