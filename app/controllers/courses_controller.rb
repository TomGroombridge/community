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
	@course.update_attribute(:quantity, @course.quantity - 1)
	redirect_to '/courses'
end


end
