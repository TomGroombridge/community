class BookingsController < ApplicationController
	before_action :find_course_date
	before_action :check_for_expired_booking

	def new
		@user = current_user
		@booking = Booking.new
		@booking_dates = @booking.booking_dates.build
	end

	def create
		@booking = Booking.create(booking_params)
		if @booking.save
			flash[:notice] = 'Booking Added'
			redirect_to dashboard_path
		else
			flash[:message] = 'Failed'
			render :new
		end
	end

	def edit
		@user = current_user
		@booking = Booking.find(params[:id])
	end

	def update
		@booking = Booking.find(params[:id])
		if @booking.update_attributes(params[:booking].permit(:name, :email, :age, :special_request, :contact_number))
			flash[:notice] = "Booking has been updated"
			redirect_to edit_course_date_booking_path(@course_date.id, @booking.id)
		else
			render :edit
		end
	end

	private

	def find_course_date
		@course_date = CourseDate.find(params[:course_date_id])
		raise 'Unauthorized' unless @course_date.course.user == current_user
	end

	def check_for_expired_booking
		raise 'Unauthorized' unless @course_date.start_date > DateTime.now
	end

	def booking_params
    params.require(:booking).permit(:order_id, :name, :email, :contact_number, :special_request, :age, booking_dates_attributes:[:booking_id, :course_date_id])
	end

end
