class Course < ActiveRecord::Base
	belongs_to :user
	has_many :payments
	
 	def to_param
  	[id, name.parameterize].join("-")
 	end

 	# def check_last_bookings
 	# 	tomorrow_date = DateTime.now + 1
 	# 	tomorrow = tomorrow_date.strftime("%m/%d/%Y") 		
 	# end

end

