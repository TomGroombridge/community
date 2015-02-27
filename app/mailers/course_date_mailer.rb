class CourseDateMailer < ActionMailer::Base
	default from: "hello@courseiam"

	def course_info(course_date)
		mail to: course_date.course.user.email, subject: "List of course attendees"
	end

	# def new_date(course_date)
	# 	@course = course_date.course
	# 	@course_date = course_date
	# 	mail to: @course.user.email, subject: "You have created a new course date"
	# end

end