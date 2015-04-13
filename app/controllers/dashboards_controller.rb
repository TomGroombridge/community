class DashboardsController < ApplicationController

	def show
		@user = current_user
		@all_courses = @user.courses
		@active_courses = @all_courses.all.includes(:course_dates).select do |course|
			course.course_dates.any?(&:active?)
		end
		@course_dates = []
		@active_courses.each do |course|
			course.course_dates.each do |date|
					if date.active?
						@course_dates << date
					else
					end
			end
		end
		@course_dates.sort_by!{|date| date.start_date_time}
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

	def transactions
		@user = current_user
		@payments = Payment.all.select{|payment| payment.company_id == @user.id }
		@payments = @payments.map do |p|
			if p.paid?
				p
			end
		end
		@payments = @payments.compact
	end

end
