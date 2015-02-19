class PaymentMailer < ActionMailer::Base
  default from: "groombridgetom@gmail.com"

  def new_payment(payment)    
    mail to: payment.email, subject: "Payment Confirmation Email"
  end

  def reminder(payment)
  	@course_date = payment.course_date.course
  	mail to: payment.email, subject: "Reminder that your course is in 24 hours"
  end

  def notification(payment)
  	@course = payment.course_date.course
  	mail to: @course.user.email, subject: "Someone has joined a class"
  end

end
