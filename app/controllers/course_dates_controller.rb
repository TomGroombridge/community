class CourseDatesController < ApplicationController

	before_action :fetch_and_authorize_course

	def new	
		@course_date = @course.course_dates.build
	end

	def create 			
		@course_date = @course.course_dates.create(params[:course_date].permit(:start_date, :end_date, :course_id, :quantity))	
		if @course_date.save								
			redirect_to course_path(@course_date.course.id)
		else
			raise "error"
		end
	end

	def course_details		
		@course_date = @course.course_dates.find(params[:id])
		@payments = @course_date.payments				
		@percentage = @payments.count.to_f / @course_date.quantity.to_f
		gon.percentage = @percentage
	end

	private

	def fetch_and_authorize_course
		@course = Course.find(params[:course_id])
		raise 'Unauthorized' unless @course.user == current_user
	end

end
