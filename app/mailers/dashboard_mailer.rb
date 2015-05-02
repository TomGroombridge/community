class DashboardMailer < ActionMailer::Base
	default from: "hello@courseiam"

	def withdraw_payments(user)
		@user = user
		email = user.email
		mail to: "groombridgetom@gmail.com", subject: "Withdraw Payments"
	end

	def withdraw_notification(user)
		@user = user
		email = user.email
		mail to: email, subject: "Withdraw Payments"
	end


end