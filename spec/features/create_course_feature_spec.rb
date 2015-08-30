require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'

	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe "Creating a Course" do

		context "given a signed in user" do
			before(:each) do
				@user = create(:user)
				user_sign_in
			end

			it "should be able to create a new course" do
				click_link('addCourse')
				fill_in "course_name", with: "Learn To Bake Bread"
				fill_in "course_what_to_wear", with: "Nothing special"
				fill_in "course_what_to_bring", with: "Just yourself"
				fill_in "course_experience", with: "No course experience needed"
				select('Food & Drink', :from => 'course_category')
				fill_in "course_course_addresses_attributes_0_address1", with: "Rye House"
				fill_in "course_course_addresses_attributes_0_address2", with: "Maces Hill"
				fill_in "course_course_addresses_attributes_0_city", with: "Cirencester"
				fill_in "course_course_addresses_attributes_0_postcode", with: "GL7 7AB"
				attach_file('imgInp', "#{Rails.root}/public/assets/art-and-crafts-c0117e033032f088b424e19a6edf20ce.jpg")
				page.find('#course_course_dates_attributes_0_start_date').set("#{DateTime.tomorrow.strftime("%Y/%m/%d")}")
				select('10', :from => 'course_course_dates_attributes_0_start_time_4i')
				select('30', :from => 'course_course_dates_attributes_0_start_time_5i')
				page.find('#course_course_dates_attributes_0_end_date').set("#{DateTime.tomorrow.strftime("%Y/%m/%d")}")
				select('17', :from => 'course_course_dates_attributes_0_end_time_4i')
				select('00', :from => 'course_course_dates_attributes_0_end_time_5i')
				fill_in "course_course_dates_attributes_0_tickets_attributes_0_name", with: "Standard Ticket"
				fill_in "course_course_dates_attributes_0_tickets_attributes_0_price", with: "75.00"
				fill_in "course_course_dates_attributes_0_tickets_attributes_0_quantity", with: "10"
				click_button("Create Course")
				visit("/course_dates")
				expect(page).to have_content("Learn To Bake Bread")
				expect(@user.courses.last.name).to eq("Learn To Bake Bread")
			end

		end
	end