class Payment < ActiveRecord::Base
	belongs_to :course_date
	belongs_to :course
	belongs_to :ticket
	belongs_to :order
	belongs_to :user
	has_many :bookings
	after_create :send_new_payment_email
	after_create :send_notification
	accepts_nested_attributes_for :bookings

	attr_accessor :stripe_card_token

	def price
		self.ticket.price
	end

	def booking_fee
		fee = self.amount_paid * 0.04
		fee.to_d
	end

	def company_fee
		if self.ticket.absorb_fee == true
			self.ticket_fee
		else
			0.00
		end
	end

	def payment_fee
		ticket.price * 0.04
	end

	def overall_payment
		if self.ticket.absorb_fee == true
			self.ticket.price
		else
			self.ticket.price + payment_fee
		end
	end

	def overall_price
		if self.ticket.absorb_fee == true
			price
		else
			payment_fee + price
		end
	end

	def profit
		amount_paid - ticket_fee
	end

	def reduce_quantity
		test = self
		test.ticket.quantity = test.ticket.quantity -= 1
	end

	def save_with_payment(params)
		@amount = self.overall_payment * 100
		@course_name = self.ticket.course_date.course.name
		@course_date = self.ticket.course_date.start_date.strftime("%d/%m/%Y")
		@quantity = self.ticket.quantity
		@booking = self.bookings.last
		if ticket.free?
			save! and return true
		end
		if valid?
			begin
				Stripe::Charge.create(
					amount: @amount.to_i,
					currency: "gbp",
					card: params[:stripe_card_token],
					description: "this is a payment for the #{@course_name} course on the #{@course_date} for #{@booking.name}")
				self.ticket.quantity -= 1
				self.save
			rescue Stripe::InvalidRequestError => e
				logger.error "Stripe error while creating customer: #{e.message}"
				errors.add :base, "There was a problem with your credit card."
			end
		end
	end

	def send_new_payment_email
		PaymentMailer.new_payment(self).deliver!
	end

	def send_notification
		PaymentMailer.notification(self).deliver!
	end

	def status
		if self.paid == true
			"yes"
		else
			"no"
		end
	end
end
