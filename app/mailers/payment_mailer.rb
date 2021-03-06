class PaymentMailer < ActionMailer::Base
  default from: "hello@courseiam"
  layout 'courseiam_mail'

  def new_payment(payment)
    @payment = payment
    @booking_dates = payment.bookings.last.booking_dates
    @course =  @booking_dates.last.course_date.course
    mail to: @payment.bookings.last.email, subject: "Payment Confirmation Email"
  end

  def notification(payment)
  	@course = payment.ticket.course_date.course
    @booking_dates = payment.bookings.last.booking_dates
    @payment = payment
  	mail to: @course.user.email, subject: "Someone has joined a class"
  end

end
