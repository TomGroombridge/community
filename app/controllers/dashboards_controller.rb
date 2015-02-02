class DashboardsController < ApplicationController
	def show
		@user = current_user
		@courses = @user.courses
	end
end
