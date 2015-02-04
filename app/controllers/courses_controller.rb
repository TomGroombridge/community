class CoursesController < ApplicationController
		

	def new
		@course = Course.new	
		@course.user = current_user
		@course.course_addresses.build
	  # authorize! :update, @course
	end

	def create 		
		@course = Course.create(params[:course].permit(:name, :description, :price, :image, :blurb, :what_to_wear, :what_to_bring, :experience, course_addresses_attributes:[:id, :postcode, :address1, :address2, :city, :county]))
		@course.user = current_user
		if @course.save
			@user =  @course.user
			UserMailer.delay_for(0.003.hours).welcome_email(@user)
			redirect_to dashboard_path		    
	  else
		  format.html { render action: 'new' }	  
		end	
	end

	def index
		@courses = Course.all.includes(:course_dates).select do |course|
			course.course_dates.any?(&:active?)
		end

		# @all_courses.each do |course|
		# 	course.course_dates.each do |date| 
		# 		if date.active? 
		# 			@courses << course
		# 			break
		# 		end				
		# 	end
		# end	
		# @courses
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
		@course.update_attributes(params[:course].permit(:name, :description, :price, :user_id, :image, :blurb, :benefits, course_addresses_attributes:[:id, :postcode, :address1, :address2, :city, :county], need_to_wears_attributes: [:id, :name], brings_attributes: [:id, :name]))
		redirect_to '/courses'
	end
	

end
