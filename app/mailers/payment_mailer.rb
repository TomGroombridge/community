class PaymentMailer < ActionMailer::Base
  default from: "tom@example.com"

  def new_payment(post, user)
    @payment = post
    mail to: user.email, subject: "Thanks for the post!"
  end

  def reminder(course, user)
  	@course_date = course
  	mail to: user.email, subject: "Reminder that your course is in 24 hours"
  end

end
