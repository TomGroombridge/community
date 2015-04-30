class PaymentMailer < ActionMailer::Base
  default from: "hello@courseiam"
  layout 'courseiam_mail'

  def new_payment(payment)
    @payment = payment
    mail to: @payment.bookings.last.email, subject: "Payment Confirmation Email"
  end

  def reminder(booking_id)
    @booking = Booking.find(booking_id)
    @course_date = @booking.payment.ticket.course_date
    puts "MSPX @booking: #{@booking.to_yaml}"
    @course = @booking.payment.ticket.course_date.course
    puts "MSPX @course: #{@course.to_yaml}"
  	mail to: @booking.email, subject: "Reminder that your course is in less than 24 hours"
  end

  def notification(payment)
  	@course = payment.ticket.course_date.course
    @payment = payment
  	mail to: @course.user.email, subject: "Someone has joined a class"
  end

end
