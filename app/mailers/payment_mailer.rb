class PaymentMailer < ActionMailer::Base
  default from: "hello@courseiam"
  layout 'courseiam_mail'

  def new_payment(payment)
    @payment = payment
    mail to: @payment.bookings.last.email, subject: "Payment Confirmation Email"
  end

  def reminder(booking)
    @booking = booking
    # @course_date = @booking.payment.ticket.course_date
    # @course = @booking.payment.ticket.course_date.course
  	mail to: @booking.email, subject: "Reminder that your course is in less than 24 hours"
  end

  def notification(payment)
  	@course = payment.ticket.course_date.course
    @payment = payment
  	mail to: @course.user.email, subject: "Someone has joined a class"
  end

end
