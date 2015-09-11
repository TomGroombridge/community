require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe "withdrawing funds" do

		context "given a sign in admin user" do

			xit "should allow me to check my acount balance" do

			end

			xit "should update my acount balance once payment has been taken for a booking" do

			end

			xit "should add fees outstanding if the ticket absorbs the fee" do

			end

			xit 'should add to the booking fee for every booking that is taken' do

			end

			xit "should put the acount balance back to 0 and the outstanding fees to 0 when you request to transfer the funds from your account" do

			end

		end
	end
