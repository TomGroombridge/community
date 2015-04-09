class PaymentMailer < ActionMailer::Base
  default from: "hello@courseiam"
  layout 'courseiam_mail'

  def new_payment(payment)
    @payment = payment
    @payment.order.bookings.each {|booking| mail to: booking.email, subject: "Payment Confirmation Email"}
  end

  def reminder(payment)
    @payment = payment
    @course_date = payment.ticket.course_date
    @course = payment.ticket.course_date.course
  	mail to: payment.email, subject: "Reminder that your course is in 24 hours"
  end

  def notification(payment)
  	@course = payment.ticket.course_date.course
    @payment = payment
  	mail to: @course.user.email, subject: "Someone has joined a class"
  end

end
