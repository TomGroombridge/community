class Booking < ActiveRecord::Base
	belongs_to :order
	has_many :booking_dates
	accepts_nested_attributes_for :booking_dates

end
