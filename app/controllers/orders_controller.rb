class OrdersController < ApplicationController
	before_action :fetch_and_authorize_ticket, :except => [:index]

	def new
		@order = Order.new
		@order.ticket_id = @ticket.id
		@order.bookings.build #add n.times{} depedning on the number of bookings being made
		@order.bookings.each {|booking| @ticket.number_of_dates.times{booking.booking_dates.build}}

		@course_dates = @ticket.course_date.course.course_dates
		@course_dates.map do |cd|
			cd.start_time ==  cd.start_date_time.strftime("%A, %d %b %Y %l:%M %p")
		end
		@course_date = @ticket.course_date
	end

	def create
		@order = Order.create(params[:order].permit(:ticket_id, bookings_attributes:[:order_id, :name, :email, :number, :payment_id, booking_dates_attributes:[ :booking_id, :course_date_id, :name]]))
		if @order.save
			redirect_to new_payment_path(:id => @ticket.id, :course_date_id => @ticket.course_date.id, :order_id => @order.id)
		else
			raise "error"
		end
	end


	private

	def fetch_and_authorize_ticket
		@ticket = Ticket.find(params[:ticket_id])
	end
end
