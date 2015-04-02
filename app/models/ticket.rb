class Ticket < ActiveRecord::Base
	belongs_to :course_date
	has_many :payments

	def free?
    price.zero?
  end
end
