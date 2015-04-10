class CourseDateMailer < ActionMailer::Base
	default from: "hello@courseiam"

	layout 'courseiam_mail'


	def course_info(course_date)
		@course_date = course_date
		@user = @course_date.course.user.email
		@total = @course_date.payments.count * @course_date.course.price
		mail to: @user, subject: "List of course attendees"
	end

	# def new_date(course_date)
	# 	@course = course_date.course
	# 	@course_date = course_date
	# 	mail to: @course.user.email, subject: "You have created a new course date"
	# end

end