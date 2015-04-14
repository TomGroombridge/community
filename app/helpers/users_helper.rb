module UsersHelper

	def account_balance(user)
		number_to_currency(user.balance, :precision => 2, :unit => "£")
	end
end
