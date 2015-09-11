require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe 'unauthorised users' do

		context 'if a user is not signed in' do
			before(:each) do
				create(:course)
			end

			it 'should not allow you to view the dashboard' do
				expect{visit "/dashboard"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the courses/new' do
				expect{visit "/courses/new"}.to raise_error("Unauthorized")
			end

			it 'should not allow you to view the user/edit' do
				expect{visit "/user/edit"}.to raise_error("Unauthorized")
			end

			xit 'should not allow you to view the /dashboard/transactions' do

			end

			xit 'should not allow you to view the /dashboard/bookings' do

			end

			xit 'should not allow you to view the course_details' do

			end

			xit 'should not allow you to view the course_dates/new' do

			end

			xit 'should not allow you to view the bookings/new' do

			end

			xit 'should not allow you to view the booking_dates/show' do

			end

			xit 'should not allow you to view the course_dates/edit' do

			end


		end

		context 'if a user is signed in but its not their account' do

			xit 'should not allow you to view the course_dates/new for courses that they dont own' do

			end

			xit 'should not allow you to view the /dashboard/transactions for transactions that they dont own' do

			end

			xit 'should not allow you to view the /dashboard/bookings for bookings that they dont own' do

			end

			xit 'should not allow you to view the course_details for courses that they dont own' do

			end

			xit 'should not allow you to view the course_dates/new' do

			end

			xit 'should not allow you to view the bookings/new' do

			end

			xit 'should not allow you to view the booking_dates/show for bookings they dont own' do

			end

			xit 'should not allow you to view the course_dates/edit for courses they dont own' do

			end


		end

	end