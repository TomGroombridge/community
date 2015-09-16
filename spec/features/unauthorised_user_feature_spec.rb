require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe 'unauthorised users' do

		context 'if a user is not signed in' do
			before(:each) do
				@course = create(:course)
				@user = create(:user)
				@course.update_attributes(:user_id => @user.id)
			end

			it 'should not allow you to view the dashboard' do
				expect{visit "/dashboard"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the courses/new' do
				expect{visit "/courses/new"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the user/edit' do
				expect{visit "/users/#{@user.id}/edit"}.to raise_error("You are not authorized to access this page.")
			end

			it 'should not allow you to view the /dashboard/transactions' do
				expect{visit "/dashboard/transactions"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the /dashboard/bookings' do
				expect{visit "/dashboard/bookings"}.to raise_error("Unauthorized")
			end

			xit 'should not allow you to view the course_details' do
				expect{visit "/dashboard/bookings"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the course_dates/new' do
				expect{visit "/courses/#{@course.id}/course_dates/new"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the bookings/new' do
				create_course_with_date_and_ticket
				@course.update_attributes(:user_id => @user.id)
				expect{visit "/course_dates/#{@course_date.id}/bookings/new"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the booking_dates/show' do
				create_course_with_date_and_ticket
				@course.update_attributes(:user_id => @user.id)
				create_booking
				expect{visit "/booking_dates/#{@booking_date.id}"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the course_dates/edit' do
				create_course_with_date_and_ticket
				@course.update_attributes(:user_id => @user.id)
				expect{visit "courses/#{@course.id}/course_dates/#{@course_date.id}/edit"}.to raise_error("Unauthorized")
			end


		end

		context "if a user is signed in but doesn't have admin rights" do
			before(:each) do
				@user = create(:user)
				user_sign_in
				@user.update_attributes(:admin => false)
				create_course_with_date_and_ticket
			end

			it 'should not allow you to view the course_dates/new for courses that they dont own' do
				expect{visit "/courses/new"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the /dashboard/transactions for transactions that they dont own' do
				expect{visit "/dashboard/transactions"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the /dashboard/bookings for bookings that they dont own' do
				expect{visit "/dashboard/bookings"}.to raise_error("Unauthorized")
			end

			xit 'should not allow you to view the course_details for courses that they dont own' do
				expect{visit "/dashboard/bookings"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the course_dates/new' do
				expect{visit "/courses/#{@course.id}/course_dates/new"}.to raise_error("Unauthorized")
			end

			xit 'should not allow you to view the bookings/new' do

			end

			xit 'should not allow you to view the booking_dates/show for bookings they dont own' do

			end

			xit 'should not allow you to view the course_dates/edit for courses they dont own' do

			end


		end

	end