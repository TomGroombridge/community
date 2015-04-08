class Order < ActiveRecord::Base
	belongs_to :ticket
	has_many :bookings


end
