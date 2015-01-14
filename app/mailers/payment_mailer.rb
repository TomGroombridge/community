class PaymentMailer < ActionMailer::Base
  default from: "tom@example.com"

  def new_payment(post, user)
    @payment = post
    mail to: user.email, subject: "Thanks for the post!"
  end

end
