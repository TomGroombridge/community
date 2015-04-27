class CourseDatesController < ApplicationController
	before_action :fetch_and_authorize_course, :except => [:index]

	def new
		@course_date = @course.course_dates.build
		@course_date.tickets.build
	end

	def create
		@course_date = @course.course_dates.create(params[:course_date].permit(:start_date, :start_time, :end_date, :end_time, :course_id, tickets_attributes:[:course_date_id, :price, :quantity, :absorb_fee, :number_of_dates]))
		if @course_date.save
			redirect_to dashboard_path(@course_date.course.user.id)
			flash[:notice] = 'New Course Date Created'
		else
			raise "error"
		end
	end

	def edit
		@course_date = CourseDate.find(params[:id])
	end

	def course_details
		@course_date = @course.course_dates.find(params[:id])
		@payments = @course_date.payments
		@course_date.tickets_left
		@percentage = (@course_date.booking_dates.count.to_f /  @course_date.max_tickets.to_f)
		gon.percentage = @percentage
		@user = current_user
	end

	def update
		@course_date = CourseDate.find(params[:id])
		if @course_date.update_attributes(params[:course_date].permit(:start_date, :start_time, :end_date, :end_time, :course_id, tickets_attributes:[:id, :name, :course_date_id, :price, :quantity, :absorb_fee, :number_of_dates]))
			redirect_to course_details_course_course_date_path(@course_date.course_id, @course_date.id)
		else
			render :edit
		end
	end

	def index
		@active_course_dates = []
		CourseDate.all.each  do |d|
			if d.start_date_time > DateTime.now
				@active_course_dates << d
			end
		end
		@course_dates = @active_course_dates.sort_by do |course_date|
			course_date.start_date_time
		end
	end

	private

	def fetch_and_authorize_course
		@course = Course.find(params[:course_id])
		raise 'Unauthorized' unless @course.user == current_user
	end

end
