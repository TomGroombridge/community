class Booking < ActiveRecord::Base
	belongs_to :order
	belongs_to :payment
	has_many :booking_dates
	accepts_nested_attributes_for :booking_dates
	validates_presence_of :name

	def self.search(search)
	  where("email LIKE ?", "%#{search}%")
	end


end
