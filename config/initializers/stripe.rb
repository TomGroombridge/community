if Rails.env.development?
	Stripe.api_key = Rails.application.secrets.secret_key
else
	Rails.configuration.stripe = {
	  :publishable_key => ENV['PUBLISHABLE_KEY'],
	  :secret_key      => ENV['SECRET_KEY']
	}

	Stripe.api_key = Rails.configuration.stripe[:secret_key]
end
