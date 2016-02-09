class CoursesController < ApplicationController
	before_action :fetch_and_authorize_course, :except => [:index, :show]
	before_action :fetch_and_authorize_user, :except => [:index, :show, :new, :create]

	def new
		@course = Course.new
		@course.user = current_user
		@course.course_addresses.build
		course_dates = @course.course_dates.build
		course_dates.tickets.build
		@course.confirmation_emails.build
	end

	def create
		@course = Course.new(course_params)
		@course.user = current_user
		if @course.save
			@user =  @course.user
			render :crop
	  else
		  format.html { render action: 'new' }
		end
	end

	def index
		@active_courses = Course.all.includes(:course_dates).select do |course|
			course.course_dates.any?(&:active?)
		end
		@courses = @active_courses.sort_by! do |course|
			course.upcoming_date.start_date_time
		end
	end

	def show
	  @course = Course.find(params[:id])
	  @user = @course.user
	  render layout: "iframe-#{params[:embed]}" if params[:embed]
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		if @course.update_attributes(params[:course].permit(:name, :description, :price, :avatar, :crop_x, :crop_y, :crop_w, :crop_h, :what_to_wear, :what_to_bring, :experience, :category, confirmation_emails_attributes:[:content, :course_id, :id, :attachment_one, :attachment_two, :attachment_three], course_addresses_attributes:[:id, :postcode, :address1, :address2, :city, :county, :longitude, :latitude], course_dates_attributes:[:id, :start_time, :end_time, :start_date, :end_date, :absorb_fee, :number_of_dates]))
			if params[:course][:avatar].present?
				render :crop
			else
				redirect_to dashboard_path
				flash[:notice] = 'New Course Successfully Created'
			end
		else
			render :new
		end
	end

	private

	def fetch_and_authorize_course
		if current_user.nil?
			raise 'Unauthorized'
		else
			raise 'Unauthorized' unless current_user.admin == true
		end
	end

	def fetch_and_authorize_user
		@course = Course.find(params[:id])
		raise 'Unauthorized' unless @course.user == current_user
	end

	def course_params
    params.require(:course).permit(:name, :description, :price, :avatar, :crop_x, :crop_y, :crop_w, :crop_h, :what_to_wear, :private, :what_to_bring, :experience, :category, :age_needed, confirmation_emails_attributes:[:content, :course_id, :id, :attachment_one, :attachment_two, :attachment_three], course_addresses_attributes:[:id, :postcode, :address1, :address2, :city, :county, :longitude, :latitude], course_dates_attributes:[:id, :start_time, :end_time, :start_date, :end_date, :course_id, tickets_attributes:[:id, :name, :course_date_id, :price, :quantity, :absorb_fee, :number_of_dates]])
	end

end
