class CourseProviderMailer < ActionMailer::Base
  default from: "hello@courseiam"

  def weekly_summary(course_id)
    @course = Course.find(course_id)
    @course_dates = @course.course_dates.where(active: true)
    @tutor = @course.user
    mail(to: @tutor.email, subject: "Weekly summary for #{Time.current}")
  end
end
