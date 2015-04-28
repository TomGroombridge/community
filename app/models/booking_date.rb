class BookingDate < ActiveRecord::Base
	belongs_to :booking
	belongs_to :course_date
end
