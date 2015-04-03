class DashboardsController < ApplicationController

	def show
		@user = current_user
		@all_courses = @user.courses
		@active_courses = @all_courses.all.includes(:course_dates).select do |course|
			course.course_dates.any?(&:active?)
		end
		@courses = @active_courses.sort_by! do |course|
			course.upcoming_date.start_date_time
		end
		@payments = Payment.all.select{|payment| payment.company_id == @user.id }
		@monthly_payments = @payments.select {|p| p.created_at >= Date.today.beginning_of_month}
		@price = @monthly_payments.map {|p| p.price}
		@revenue = @price.inject {|sum, n| sum += n }
	end

end
