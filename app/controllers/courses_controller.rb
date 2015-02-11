class CoursesController < ApplicationController
		

	def new
		@course = Course.new	
		@course.user = current_user		
		@course.course_addresses.build
		@course.course_dates.build
	  # authorize! :update, @course
	end

	def create 		
		@course = Course.create(params[:course].permit(:name, :description, :price, :avatar, :crop_x, :crop_y, :crop_w, :crop_h, :blurb, :what_to_wear, :what_to_bring, :experience, course_addresses_attributes:[:id, :postcode, :address1, :address2, :city, :county], course_dates_attributes:[:id, :start_time, :end_time, :start_date, :end_date, :quantity]))
		@course.user = current_user
		if @course.save
			@user =  @course.user
			UserMailer.delay_for(0.003.hours).welcome_email(@user)
			if params[:course][:avatar].present?
				render :crop
			else
				# redirect_to course_path(@course)
				render :preview
			end
	  else
		  format.html { render action: 'new' }	  
		end	
	end

	def index
		@courses = Course.all.includes(:course_dates).select do |course|
			course.course_dates.any?(&:active?)
		end
	end

	def show
	  @course = Course.find(params[:id])	  	  
	  render layout: "iframe-#{params[:embed]}" if params[:embed]
	end
	
	def edit 
		@course = Course.find(params[:id])  
	end

	def update 
		@course = Course.find(params[:id])	
		if @course.update_attributes(params[:course].permit(:name, :description, :price, :avatar, :crop_x, :crop_y, :crop_w, :crop_h, :blurb, :what_to_wear, :what_to_bring, :experience, course_addresses_attributes:[:id, :postcode, :address1, :address2, :city, :county], course_dates_attributes:[:id, :start_time, :end_time, :start_date, :end_date, :quantity]))
			if params[:course][:avatar].present?
				render :crop
			else
				# redirect_to course_path(@course)
				render :preview
			end
		else
			render :new
		end
	end
	

end
