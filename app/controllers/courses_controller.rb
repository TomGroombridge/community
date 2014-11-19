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


end
