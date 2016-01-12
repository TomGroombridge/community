class CourseDateMailer < ActionMailer::Base
	default from: "hello@courseiam"

	layout 'courseiam_mail'


	def course_info(course_date_id)
		@course_date = CourseDate.find(course_date_id)
		puts "MSPX @course: #{@course_date.to_yaml}"
		@user = @course_date.course.user
		mail to: @user.email, subject: "List of course attendees"
	end

end