module UsersHelper

	def account_balance(user)
		if user.balance == nil
			"£0.00"
		else
			number_to_currency(user.balance, :precision => 2, :unit => "£")
		end
	end
end
