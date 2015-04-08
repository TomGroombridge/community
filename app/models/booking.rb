class Booking < ActiveRecord::Base
	belongs_to :order
	has_many :booking_dates


end
