class CoursesController < ApplicationController

def new
	@course = Course.new
end

def create 
	Course.create params[:course].permit(:name, :description)
	redirect_to '/courses'
end

def index
	@courses = Course.all
end

end
