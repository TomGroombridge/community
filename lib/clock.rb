require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

# https://devcenter.heroku.com/articles/clock-processes-ruby
# https://github.com/tomykaira/clockwork
every(1.week, 'Email bookings to course providers') do
  Course.provider_mailer
end