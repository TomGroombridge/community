class CoursesController < ApplicationController

def new
	@course = Course.new	
	@course.user = current_user
	@course.course_addresses.build
end

def create 		
	@course = Course.create(params[:course].permit(:name, :description, :price, :user_id, :image, :blurb, :address, :need_to_bring, :benefits, :need_to_wear, course_addresses_attributes:[:id, :postcode]))
	if @course.save
		@user =  @course.user
		UserMailer.welcome_email(@user).deliver		
    redirect_to '/courses'
  else
	  format.html { render action: 'new' }	  
	end	
end

def index
	@courses = []
	@all_courses = Course.all
	@all_courses.each do |course|
		if course.active == true
			@courses << course
		end
	end
	@courses
end

def show
  @course = Course.find(params[:id])  
end

def update_quantity
	@course = Course.find(params[:course_id])
	if @course.quantity <= 0
		raise "test"
	else
		@course.update_attribute(:quantity, @course.quantity - 1)
	end
	redirect_to '/courses'
end


end
