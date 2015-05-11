class PaymentMailer < ActionMailer::Base
  default from: "hello@courseiam"
  layout 'courseiam_mail'

  def new_payment(payment)
    @payment = payment
    mail to: @payment.bookings.last.email, subject: "Payment Confirmation Email"
  end

  def notification(payment)
    @booking_dates = payment.order.bookings.last.booking_dates
  	@course = @booking_dates.last.course_date.course
    @payment = payment
  	mail to: @course.user.email, subject: "Someone has joined a class"
  end

end
