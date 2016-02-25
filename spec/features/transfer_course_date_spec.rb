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

			it "should not allow you to transfer a booking that is in the past" do
				# visit "/dashboard"
				# # click_link('Manage')
				# # puts CourseDate.last.inspect
				# puts Course.count
				# puts CourseDate.last.booking_dates.count
				# # puts CourseDate.last.booking_dates.last.booking.inspect
				# # puts CourseDate.last.booking_dates.last.booking.order.inspect
				# # puts CourseDate.bookings
				# within('.attendee-name') { expect(page).to have_content("tom groombridge") }

			end

		end

	end