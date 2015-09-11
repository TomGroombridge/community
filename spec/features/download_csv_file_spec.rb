require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe 'emails' do

		context 'given a signed in admin user and list of payments/bookings' do

			xit "should allow me to view a list of bookings from this week and download a csv file with them all in it" do

			end

			xit "should allow me to view a list of bookings from this month and download a csv file with them all in it" do

			end

			xit "should allow me to view a list of all bookings and download a csv file with them all in it" do

			end

			xit "should allow me to view a list of transactions from this week and download a csv file with them all in it" do

			end

			xit "should allow me to view a list of transactions from this month and download a csv file with them all in it" do

			end

			xit "should allow me to view a list of all transactions and download a csv file with them all in it" do

			end

		end

	end