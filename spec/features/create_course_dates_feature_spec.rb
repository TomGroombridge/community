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
				make_a_booking
				visit "/dashboard"
				click_link('Manage')
				within('.attendee-name') { expect(page).to have_content("tom groombridge") }
			end

			it "should not allow me edit the course date" do
				make_a_booking
				visit "/dashboard"
				click_link('Manage')
				expect(page).to have_content("tom groombridge")
				expect(page).to have_content("Tickets sold: 1/10")
			end

			it "should allow me to manually add a booking to a course date" do
				visit "/dashboard"
				click_link "Add Booking"
				fill_in "booking_name", :with => "James Groombridge"
				fill_in "booking_contact_number", :with => "01292182198"
				fill_in "booking_email", :with => "james@groombridge.com"
				click_button "Create Booking"
				expect(current_path).to eq "/dashboard"
				expect(page).to have_content "Booking Added"
			end

			it "should not allow you to add a date if the course isn't owned by you" do
				@course.update_attributes(:user_id => 100)
				expect { visit "/courses/#{@course.id}/course_dates/new" }.to raise_error
			end

			it "should allow you to transfer a booking" do
				@course_date = CourseDate.create(active: true, start_date: "2016-10-20", start_time: "2000-01-01 19:49:15", end_date: "2016-10-20", end_time: "2000-01-01 13:43:00", :course_id => @course.id)
				@booking = Booking.create(name: "Tom Groombridge", email: "groombridgetom@gmail.com", contact_number: "09382423409", special_request: "", age: nil)
				@ticket =Ticket.create(name: "Normal Tickets", price: 20.00, course_date_id: @course_date.id, quantity: 21, absorb_fee: false, number_of_dates: 1)
				@booking_date = BookingDate.create(:booking_id => @booking.id, :course_date_id => @course_date.id)
				expect(BookingDate.last.course_date.start_date.strftime("%d/%m/%Y")).to eq('20/10/2016')
				visit "/courses/#{@course.id}/course_dates/#{@course_date.id}/course_details"
				click_link ("Transfer Date")
				select((DateTime.now + 7.days).strftime("%A, %d %b %Y %l:%M %p"), :from => 'booking_date[course_date_id]')
				click_button("Transfer Date")
				@booking_date.reload
				expect(BookingDate.last.course_date.start_date.strftime("%d/%m/%Y")).to eq((DateTime.now + 7.days).strftime("%d/%m/%Y"))
			end

			xit 'should not allow you at add a course date that starts in the past' do

			end

			xit 'should not allow you at add a course date that the end date is before the start date' do

			end

		end
	end