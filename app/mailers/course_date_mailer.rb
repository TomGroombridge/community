class CourseDateMailer < ActionMailer::Base
	default from: "groombridgetom@gmail.com"

	def course_info(course_date)
		mail to: course_date.course.user.email, subject: "Info on people attending your course."
	end

end