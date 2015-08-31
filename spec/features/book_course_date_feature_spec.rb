require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe "Booking a course" do

		context "given a course" do

			before(:each) do
				@user = create(:user)
				user_sign_in
				create_food_course
			end

			it "should allow you to be able to book a place on the course", js: true do
				expect(@user.courses.last.course_dates.last.booking_dates.count).to eq(0)
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
				expect(@user.courses.last.course_dates.last.booking_dates.count).to eq(1)
				expect(@user.courses.last.course_dates.last.booking_dates.last.booking.name).to eq('tom groombridge')
			end
		end

		context "given a course with multiple_dates" do

		end
end