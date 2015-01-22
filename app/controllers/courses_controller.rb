class CoursesController < ApplicationController
		

	def new
		@course = Course.new	
		@course.user = current_user
		@course.course_addresses.build
		3.times {@course.need_to_wears.build}
		3.times {@course.brings.build}  
	  # authorize! :update, @course
	end

	def create 		
		@course = Course.create(params[:course].permit(:name, :description, :price, :user_id, :image, :blurb, :benefits, course_addresses_attributes:[:id, :postcode], need_to_wears_attributes: [:id, :name], brings_attributes: [:id, :name]))
		if @course.save
			@user =  @course.user
			UserMailer.delay_for(0.003.hours).welcome_email(@user)	
	    redirect_to '/courses'
	  else
		  format.html { render action: 'new' }	  
		end	
	end

	def index
		@courses = []
		@all_courses = Course.all
		@all_courses.each do |course|
			course.course_dates.each do |date| 
				if date.active? 
					@courses << course
					break
				end				
			end
		end	
		@courses
	end

	def show
	  @course = Course.find(params[:id])  
	end
	
	

end
