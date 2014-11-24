class CoursesController < ApplicationController

def new
	@course = Course.new
end

def create 
	Course.create params[:course].permit(:name, :description, :quantity)
	redirect_to '/courses'
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
