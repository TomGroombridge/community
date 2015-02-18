class DashboardsController < ApplicationController
	def show
		@user = current_user
		@courses = @user.courses
		@active_courses = @courses.all.includes(:course_dates).select do |course|
			course.course_dates.any?(&:active?)
		end		
		@payments = Payment.all.select{|cd| cd.course_date.course.user_id == @user.id}		
		@monthly_payments = @payments.select {|p| p.created_at >= Date.today.beginning_of_month}
		@price = @monthly_payments.map {|p| p.price}
		@revenue = @price.inject {|sum, n| sum += n } 		
	end
end
