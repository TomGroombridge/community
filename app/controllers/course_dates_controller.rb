class CourseDatesController < ApplicationController

	before_action :fetch_and_authorize_course

	def new	
		@course_date = @course.course_dates.build
	end

	def create 			
		@course_date = @course.course_dates.create(params[:course_date].permit(:start_date, :start_time, :end_date, :end_time, :course_id, :quantity))	
		if @course_date.save								
			redirect_to dashboard_path(@course_date.course.user.id)
		else
			raise "error"
		end
	end

	def edit
		@course_date = CourseDate.find(params[:id])    
	end

	def course_details		
		@course_date = @course.course_dates.find(params[:id])
		@payments = @course_date.payments				
		@percentage = @payments.count.to_f / @course_date.quantity.to_f
		gon.percentage = @percentage
	end

	def update 
		@course_date = CourseDate.find(params[:id])		
		if @course_date.update_attributes(params[:course_date].permit(:start_date, :start_time, :end_date, :end_time, :course_id, :quantity))							
			redirect_to course_details_course_course_date_path(@course_date.course_id, @course_date.id)			
		else
			render :edit
		end
	end

	private

	def fetch_and_authorize_course
		@course = Course.find(params[:course_id])
		raise 'Unauthorized' unless @course.user == current_user
	end

end
