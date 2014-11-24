class Course < ActiveRecord::Base
	has_many :payments

 	def to_param
  	[id, name.parameterize].join("-")
 	end

end
