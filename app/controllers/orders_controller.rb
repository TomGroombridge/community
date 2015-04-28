class OrdersController < ApplicationController
	before_action :fetch_and_authorize_ticket, :except => [:index]

	def new
		@order = Order.new
		@payment = @ticket.payments.build
		@payment.ticket_id = @ticket.id
    @order.bookings.build
    @order.bookings.each {|booking| booking.booking_dates.build}
    @order.ticket_id = @ticket.id
    @course_dates = @ticket.course_date.course.unsold_dates
	 	@course_dates.map do |cd|
	 		cd.start_time ==  cd.start_date_time.strftime("%A, %d %b %Y %l:%M %p")
	 	end
	end

	def create
		@order = Order.create(params[:order].permit(:ticket_id, bookings_attributes:[:order_id, :name, :email, :number, :payment_id, booking_dates_attributes:[ :booking_id, :course_date_id, :name, :email, :contact_number, :special_request]]))
		@payment = Payment.new(payment_params)
		@payment.order_id = @order.id
		if @payment.save_with_payment(payment_params)
			raise @payment.inspect
			@payment.update_attributes(:order_id => @order.id)
			redirect_to @payment
		else
			render :new
		end
	end


	private

	def fetch_and_authorize_ticket
		@ticket = Ticket.find(params[:ticket_id])
	end

  def payment_params
    params.require(:order).permit(:course_date_id, :email, :course_id, :stripe_card_token, :full_name, :mobile_number, :special_request, :quantity, :ticket_id, :course_date_id, :company_id, :order_id)
  end

end
