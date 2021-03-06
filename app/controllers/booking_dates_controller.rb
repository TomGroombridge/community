class BookingDatesController < ApplicationController
	before_action :fetch_and_authorize_course
	before_action :check_for_expired_booking

	def show
		@booking_date = BookingDate.find(params[:id])
		@ticket = @booking_date.course_date.tickets.last
		@course_dates = @ticket.course_date.course.unsold_dates
		@user = current_user
	end

	def update
		@booking_date = BookingDate.find(params[:id])
		if @booking_date.update_attributes(params[:booking_date].permit(:course_date_id))
			redirect_to :back
			flash[:notice] = 'Date transfered Sucessfully '
		else
			render :show
		end
	end

	private

	def fetch_and_authorize_course
		@booking_date = BookingDate.find(params[:id])
		raise 'Unauthorized' unless @booking_date.course_date.course.user == current_user
	end

	def check_for_expired_booking
		@course_date = @booking_date.course_date
		raise 'Unauthorized' unless @course_date.start_date > DateTime.now
	end

end
