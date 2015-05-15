class UsersController < ApplicationController
	load_and_authorize_resource :except => [:index, :show, :course_providers_index, :calendar]

	def show
	  @user = User.find(params[:id])
	  @courses = @user.courses
	  @course_dates = []
	  @courses.each {|c| c.course_dates.each {|cd| @course_dates << cd}}
	  @active_course_dates = @course_dates.select {|c| c.valid_dates(c)}
	  @course_dates = @active_course_dates.sort_by do |course_date|
			course_date.start_date_time
		end
		@calender_dates = @course_dates.group_by(&:start_date)
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
	  render layout: "iframe-#{params[:embed]}" if params[:embed]
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user].permit(:first_name, :last_name, :contact_number, :company_name, :description, :facebook, :twitter, :instagram, :google, :pinterest, :admin, :email, :avatar))
			redirect_to dashboard_path
		else
			# redirect_to course_path(@course)
			render :edit
		end
	end

	def index
		@users = User.all
	end

	def course_providers_index
		@course_providers = []
		User.all.each do |user|
			if user.admin == true
				@course_providers << user
			end
		end
		@course_providers
	end

	def dashboard
		@user = User.find(params[:id])
	end

	def calendar
		@user = User.find(params[:id])
	  @courses = @user.courses
	  @course_dates = []
	  @courses.each {|c| c.course_dates.each {|cd| @course_dates << cd}}
	  @active_course_dates = @course_dates.select {|c| c.valid_dates(c)}
	  @course_dates = @active_course_dates.sort_by do |course_date|
			course_date.start_date_time
		end
		@calender_dates = @course_dates.group_by(&:start_date)
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
		render :layout => false
	end

end
