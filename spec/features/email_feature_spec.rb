require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe 'emails' do

		xit "should send a confirmation email when someone books onto a course date" do

		end

		xit "should send a notifiaction email to course owner when someone books onto the course date" do

		end

		xit "should schedule a email to be sent 24 hours before the course date as a reminder to the person booked on" do

		end

		xit "should schedule a email to be sent with all the course info to the course owner" do

		end

		xit "should remove the scheudled email to the booking if that booking is removed" do

		end

		xit "should change the date of the scheduled job if the date is transfered" do

		end

		xit "should change the date of the scheduled job for the reminder email and course info emails if the course date changes" do

		end

		xit "should send a email to 'hello@courseiam' when a user withdraws funds" do

		end

	end