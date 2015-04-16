class DashboardMailer < ActionMailer::Base
	default from: "hello@courseiam"

	def withdraw_payments(user)
		email = user.email
		mail to: "groombridgetom@gmail.com", subject: "Withdraw Payments"
	end


end