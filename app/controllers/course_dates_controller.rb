class CourseDatesController < ApplicationController


	def new	
		@course = Course.find(params[:course_id])
		@course_date = @course.course_dates.build
	end

	def create 			
		@course_date = CourseDate.create(params[:course_date].permit(:dates, :course_id, :quantity))	
		if @course_date.save								
			redirect_to course_path(@course_date.course.id)
		else
			raise "error"
		end
	end

	def course_details		
		@course_date = CourseDate.find(params[:id])
	end

end
