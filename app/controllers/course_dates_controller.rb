class CourseDatesController < ApplicationController

def new	
	@course = Course.find(params[:course_id])
	@course_date = @course.course_dates.build
end

def create 			
	@course_date = CourseDate.create(params[:course_date].permit(:dates, :course_id))	
	if @course_date.save		
		redirect_to '/courses'
	else
		raise "error"
	end
end

end
