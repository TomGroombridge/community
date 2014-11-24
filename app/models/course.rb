class Course < ActiveRecord::Base
	has_many :payments
	has_many :users

 	def to_param
  	[id, name.parameterize].join("-")
 	end

end
