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
		if @payments.count > 0
			@price = @payments.map do |p|
				if p.manually_added == false
					p.price
				else
					0
				end
			end
			@revenue = @price.inject {|sum, n| sum += n }
		else
			@revenue = 0
			@monthly_payments = []
		end
	end

end
