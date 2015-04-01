class UsersController < ApplicationController
	load_and_authorize_resource :except => [:index, :show, :course_providers_index]

	def show
	  @user = User.find(params[:id])
	  render layout: "iframe-#{params[:embed]}" if params[:embed]
	  @courses = @user.courses
	  @course_dates = @courses.upcoming_dates
	  @upcoming_dates
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

end
