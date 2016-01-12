class BookingMailer < ActionMailer::Base
	default from: "hello@courseiam"
	layout 'courseiam_mail'

	def date_reminder(date_id)
    @booking_date = BookingDate.find(date_id)
    @course_date = @booking_date.course_date
    puts "MSPX @booking: #{@booking.to_yaml}"
    @course = @course_date.course
    puts "MSPX @course: #{@course.to_yaml}"
  	mail to: @booking_date.booking.email, subject: "Reminder that your course is in less than 24 hours"
  end

end