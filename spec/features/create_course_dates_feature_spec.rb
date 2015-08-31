require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe "Creating a course date" do
		context "Given a course and a user" do
			before(:each) do
				@user = create(:user)
				user_sign_in
				create_food_course
				@course = @user.courses.last
			end

			it "should allow me to go to my dashbaord and view that course date" do
				visit "/dashboard"
				click_link('Manage')
				expect(current_path).to eq "/courses/#{@course.id}/course_dates/#{@course.course_dates.last.id}/course_details"
				expect(page).to have_content("#{@course.course_dates.last.start_date_time.strftime("%A, %d %b %Y %l:%M %p")}")
			end

			it "should allow me to go to add a new course date from my dashboard", :js => true do
				visit "/dashboard"
				click_link('addDate')
				page.find('#course_date_start_date').set("#{(DateTime.now + 3.days ).strftime("%Y/%m/%d")}")
				select('10', :from => 'course_date_start_time_4i')
				select('30', :from => 'course_date_start_time_5i')
				page.find('#course_date_end_date').set("#{(DateTime.now + 3.days ).strftime("%Y/%m/%d")}")
				select('17', :from => 'course_date_end_time_4i')
				select('30', :from => 'course_date_end_time_5i')
				fill_in 'course_date_tickets_attributes_0_name', with: "Standard Ticket"
				fill_in 'course_date_tickets_attributes_0_price', with: "50.00"
				fill_in 'course_date_tickets_attributes_0_quantity', with: "20"
				click_button('courseSubmit')
				expect("#{@course.course_dates.count}").to eq("2")
				expect(page).to have_content("#{@course.course_dates.last.start_date_time.strftime("%A, %d %b %Y %l:%M %p")}")
			end

			it "should allow me to view the course date summary" do
				visit "/dashboard"
				click_link('Manage')
				expect(page).to have_content("#{@course.course_dates.last.start_date_time.strftime("%A, %d %b %Y %l:%M %p")}")
				expect(current_path).to eq "/courses/#{@course.id}/course_dates/#{@course.course_dates.last.id}/course_details"
			end

			it "should allow me to view the attendees for that course date" do
				visit "/dashboard"
				click_link('Manage')
			end

			it "should not allow me edit the course date" do
				make_a_booking
				visit "/dashboard"
				click_link('Manage')
				expect(page).to have_content("tom groombridge")
				expect(page).to have_content("Tickets sold: 1/10")
			end

			it "should allow me delete the course date if there is no one booked onto it" do

			end

			it "should allow me to manually add a booking to a course date" do

			end

			it "should not allow you to add a date if the course isn't owned by you" do

			end

		end
	end