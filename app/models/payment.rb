class Payment < ActiveRecord::Base
	belongs_to :course_date
	belongs_to :course
	belongs_to :user		
	after_create :send_new_payment_email
	# after_create :send_reminder
	attr_accessor :stripe_card_token


	def save_with_payment			
		@amount = self.course_date.course.price	
		@email = self.email			
		@name = self.full_name		
		@course_name = self.course_date.course.name
		@course_date = self.course_date.dates.strftime("%m/%d/%Y")
	  if valid?	  	
	    customer = Stripe::Customer.create(card: stripe_card_token, email: @email, description: @name)
	    self.stripe_customer_token = customer.id	  	      	    	    
	    Stripe::Charge.create(amount: @amount, currency: "gbp", customer: customer.id, description: "this is a payment for the #{@course_name} course on the #{@course_date}" )
	    save!	    
	  end
		rescue Stripe::InvalidRequestError => e
		  logger.error "Stripe error while creating customer: #{e.message}"
		  errors.add :base, "There was a problem with your credit card."
		  false
	end

	def send_reminder				
		PaymentMailer.delay_until(course_date.dates - 24.hours).reminder(self)
	end

	def send_new_payment_email
		PaymentMailer.new_payment(self).deliver!
	end
end
