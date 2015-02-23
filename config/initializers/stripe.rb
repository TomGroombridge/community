if Rails.env.development?
	Stripe.api_key = Rails.application.secrets.secret_key
else
	Rails.configuration.stripe = {
	  :publishable_key => 'pk_test_IVRbMpgxt78N8kheMNLN55Og',
	  :secret_key      => 'sk_test_N7UZshZYAONoRj5eyV0WtH8f'
	}

	Stripe.api_key = Rails.configuration.stripe[:secret_key]
end
