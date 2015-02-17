module ApplicationHelper

	def start_of_month
		(Date.today.beginning_of_month..Date.today).to_a
	end

end
