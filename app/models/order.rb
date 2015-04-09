class Order < ActiveRecord::Base
	belongs_to :ticket
	has_many :bookings
	has_one :payment
	accepts_nested_attributes_for :bookings

end
