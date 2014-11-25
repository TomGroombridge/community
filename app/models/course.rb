class Course < ActiveRecord::Base
	belongs_to :user
	has_many :payments
	
 	def to_param
  	[id, name.parameterize].join("-")
 	end

end
