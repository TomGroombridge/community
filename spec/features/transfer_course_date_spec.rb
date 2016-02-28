require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe "transfer course date" do

		context "Given a course date that is in the past" do

			before(:each) do
				@user = create(:user)
				user_sign_in
				create_food_course
				@booking = create(:booking, order_id: 1, name: "tom groombridge", email: "test@account.com", contact_number: "01285 6452968")
				@booking_date = create(:booking_date, booking_id: @booking.id, course_date_id: CourseDate.last.id)
			end

			it "should not allow you to visit the booking edit page if the course date is in the past" do
				@course_date.update_attributes(start_date: (DateTime.now - 1.days))
				expect{visit "/course_dates/#{@course_date.id}/bookings/#{@booking.id}/edit"}.to raise_error("Unauthorized")
			end

			it "should not allow you to see the 'Transfer Booking' button if the course date is in the past" do
				@course_date.update_attributes(start_date: (DateTime.now - 1.days))
				visit "/dashboard"
				click_link("Manage")
				expect(page).to_not have_content("Transfer Date")
			end

		end

	end