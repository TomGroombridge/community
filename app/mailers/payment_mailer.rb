class PaymentMailer < ActionMailer::Base
  default from: "tom@example.com"

  def new_payment(payment)    
    mail to: payment.email, subject: "Payment Confirmation Email"
  end

  def reminder(payment)
  	@course_date = payment.course_date.course
  	mail to: payment.email, subject: "Reminder that your course is in 24 hours"
  end

end
