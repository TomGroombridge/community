class Payment < ActiveRecord::Base
	belongs_to :course_date
	belongs_to :course
	belongs_to :user
	after_create :send_new_payment_email
	after_create :send_reminder
	after_create :send_notification
	# after_create :check_course_date_active
	attr_accessor :stripe_card_token


	# def check_course_date_active
	# 	if course_date.quantity == 0
	# 		course_date.update_attributes(active: false)
	# 	end
	# end

	def price
		course_date.course.price
	end

	def booking_fee
		course_date.course.price * 0.04
	end

	def overall_price
		booking_fee + price
	end

	def save_with_payment(params)
		@amount = self.overall_price * 100
		@email = self.email
		@name = self.full_name
		@course_name = self.course_date.course.name
		@course_date = self.course_date.start_date.strftime("%d/%m/%Y")
		if course_date.course.free?
			save! and return true
		end
		if valid?
			begin
				Stripe::Charge.create(
					amount: @amount.to_i,
					currency: "gbp",
					card: params[:stripe_card_token],
					description: "this is a payment for the #{@course_name} course on the #{@course_date}  by #{@name}")
				self.course_date.quantity -= 1
				self.save
			rescue Stripe::InvalidRequestError => e
				logger.error "Stripe error while creating customer: #{e.message}"
				errors.add :base, "There was a problem with your credit card."
			end
		end
	end

	def send_reminder
		PaymentMailer.delay_until(course_date.start_date_time - 24.hours).reminder(self)
		# PaymentMailer.reminder(self).deliver!
	end

	def send_new_payment_email
		PaymentMailer.new_payment(self).deliver!
	end

	def send_notification
		PaymentMailer.notification(self).deliver!
	end
end
