class CourseDateMailer < ActionMailer::Base
	default from: "hello@courseiam"

	layout 'courseiam_mail'


	def course_info(course_date_id)
		@course_date = CourseDate.find(course_date_id)
		puts "MSPX @course: #{@course_date.to_yaml}"
		@user = @course_date.course.user
		@price = []
		@course_date.booking_dates.each {|d| @price << d.booking.payment.price}
		@total = @price.inject {|sum, n| sum += n }
		mail to: @user.email, subject: "List of course attendees"
	end

	# def new_date(course_date)
	# 	@course = course_date.course
	# 	@course_date = course_date
	# 	mail to: @course.user.email, subject: "You have created a new course date"
	# end

end