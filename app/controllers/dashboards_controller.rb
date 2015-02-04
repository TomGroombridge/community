class DashboardsController < ApplicationController
	def show
		@user = current_user
		@courses = @user.courses
		@active_courses = @courses.all.includes(:course_dates).select do |course|
			course.course_dates.any?(&:active?)
		end		
		# @course_dates = @courses.all.includes(:course_dates).select do |course|
		# 	course.course_dates.any?(&:active?)
		# end
	end
end
