class BookingsController < ApplicationController
	# before_action :fetch_and_authorize_ticket, :except => [:index]
	before_action :find_course_date

	def new
		@booking = Booking.new
		@booking_dates = @booking.booking_dates.build
	end

	def create
		@booking = Booking.new(booking_params)
		@booking.save
		raise @booking.inspect
	end

	private

	# def fetch_and_authorize_ticket
	# 	@ticket = Ticket.find(params[:ticket_id])
	# end

	def find_course_date
		@course_date = CourseDate.find(params[:course_date_id])
	end

	def booking_params
    params.require(:booking).permit(:order_id, :name, :email, :contact_number, :special_request, booking_dates_attributes:[:booking_id, :course_date_id])
	end

end
