class CoursesController < ApplicationController

def new
	@course = Course.new
	@course.user = current_course_provider	
end

def create 		
	@course = Course.create(params[:course].permit(:name, :description, :quantity, :Date, :price, :user_id))
	if @course.save
		@user =  @course.user
		UserMailer.welcome_email(@user).deliver		
    redirect_to '/courses'
  else
	  format.html { render action: 'new' }	  
	end	
end

def index
	@courses = Course.all
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
