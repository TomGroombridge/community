require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe 'emails' do

		before(:each) do
			@user = create(:user)
			user_sign_in
			create_food_course
			ActionMailer::Base.deliveries = []
		end

		it "should send a confirmation email when someone books onto a course date" do
			visit "/course_dates"
			click_link('Learn To Bake Bread')
			click_link('bookNow')
			click_link('bookDate')
			fill_in 'cardName', with: "Tom Groombridge"
			fill_in 'card_number', with: '4242424242424242'
			select '1 - January', from: 'card_month'
			select '2016', from: 'card_year'
			fill_in 'card_code', with: '444'
			click_button('Send Payment')
			emails = ActionMailer::Base.deliveries
			expect(emails.count).to eq(2)
			expect(emails.first.subject).to eq("Payment Confirmation Email")
		end

		it "should send a notifiaction email to course owner when someone books onto the course date" do
			visit "/course_dates"
			click_link('Learn To Bake Bread')
			click_link('bookNow')
			click_link('bookDate')
			fill_in 'cardName', with: "Tom Groombridge"
			fill_in 'card_number', with: '4242424242424242'
			select '1 - January', from: 'card_month'
			select '2016', from: 'card_year'
			fill_in 'card_code', with: '444'
			click_button('Send Payment')
			emails = ActionMailer::Base.deliveries
			expect(emails.count).to eq(2)
			expect(emails.last.subject).to eq("Someone has joined a class")
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