class Ticket < ActiveRecord::Base
	belongs_to :course_date
	has_many :payments

	def free?
    price.zero?
  end

  def places_left
  	payments = self.payments.count
  	tickets = self.quantity
  	tickets - payments
  end
end
