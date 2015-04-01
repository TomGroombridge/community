class UserMailer < ActionMailer::Base
  default from: "hello@courseiam"
  layout 'courseiam_mail'

  def welcome_email(user, course)
    @user = user
    @course = course
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Course has been created')
  end
end
