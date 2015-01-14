class DashboardController < ApplicationController
	
	def index				
		@user = current_user	
	end

	def course_details
		@course = CourseDate.find(params[:course_id])
	end


end
