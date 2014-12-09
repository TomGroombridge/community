class DashboardController < ApplicationController

	def index
		@user = User.find params[:user_id]
		@courses = []
			Course.all.each do |course| 
				if course.user_id == @user.id
					@courses << course  
				end 
			end		 
		@courses				
	end

	def course_details
		@course = Course.find(params[:course_id])
	end


end
