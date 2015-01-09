class DashboardController < ApplicationController

	def index
		@user = User.find params[:user_id]
		@courses = []
			CourseDate.all.each do |course| 				
				if course.course.user_id == @user.id
					@courses << course 
				end 
			end		 
		@courses				
	end

	def course_details
		@course = CourseDate.find(params[:course_id])
	end


end
