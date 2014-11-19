class Course < ActiveRecord::Base

 	def to_param
  	[id, name.parameterize].join("-")
 	end

end
