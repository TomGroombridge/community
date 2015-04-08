class BookingsController < ApplicationController
	before_action :fetch_and_authorize_ticket, :except => [:index]

	def new
		@order = Order.create(params[:order])
		@order.ticket_id = @ticket.id
		@bookings = @order.bookings.build
		# raise @bookings.inspect
		# @order.bookings.build #add n.times{} depedning on the number of bookings being made
		@order.bookings.each {|booking| 3.times{booking.booking_dates.build}}
		# raise @order.bookings.last.booking_dates.inspect
		# raise @order.bookings.inspect
		@course_dates = @ticket.course_date.course.course_dates
		@course_dates.map do |cd|
			cd.start_time ==  cd.start_date_time.strftime("%A, %d %b %Y %l:%M %p")
		end
		@course_date = @ticket.course_date
	end

	private

	def fetch_and_authorize_ticket
		@ticket = Ticket.find(params[:ticket_id])
	end

end
