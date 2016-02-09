require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe "edit booking dates" do
		context "Give a booking on a course" do
			before(:each) do
				@user = create(:user)
				user_sign_in
				create_food_course
				@course = @user.courses.last
				@course_date = @course.course_dates.last
				@booking = Booking.create(name: "Tom Groombridge", email: "groombridgetom@gmail.com", contact_number: "09382423409", special_request: "", age: nil)
				@booking_date = BookingDate.create(:booking_id => @booking.id, :course_date_id => @course_date.id)
			end

			it "should be able to edit the name of the booking" do
				visit "/course_dates/#{@course_date.id}/bookings/#{@booking.id}/edit"
				fill_in "booking[name]", :with => "Jack James"
				click_button "bookingEdit"
				@booking.reload
				expect(@booking.name).to eq("Jack James")
			end

			it "should be able to edit the email of the booking" do
				visit "/course_dates/#{@course_date.id}/bookings/#{@booking.id}/edit"
				fill_in "booking[email]", :with => "test@test.com"
				click_button "bookingEdit"
				@booking.reload
				expect(@booking.email).to eq("test@test.com")
			end

			it "should be able to contact_number the name of the booking" do
				visit "/course_dates/#{@course_date.id}/bookings/#{@booking.id}/edit"
				fill_in "booking[contact_number]", :with => "07540 726507"
				click_button "bookingEdit"
				@booking.reload
				expect(@booking.contact_number).to eq("07540 726507")
			end

			it "should be able to edit the special_request of the booking" do
				visit "/course_dates/#{@course_date.id}/bookings/#{@booking.id}/edit"
				fill_in "booking[special_request]", :with => "I don't like heights"
				click_button "bookingEdit"
				@booking.reload
				expect(@booking.special_request).to eq("I don't like heights")
			end

			it "should be able to edit the age of the booking" do
				visit "/course_dates/#{@course_date.id}/bookings/#{@booking.id}/edit"
				fill_in "booking[age]", :with => "21"
				click_button "bookingEdit"
				@booking.reload
				expect(@booking.age).to eq(21)
			end
		end
	end
