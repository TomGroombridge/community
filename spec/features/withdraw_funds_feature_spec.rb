require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe "withdrawing funds" do

		context "given a sign in admin user" do

			it "should allow me to check my acount balance" do

			end

			it "should update my acount balance once payment has been taken for a booking" do

			end

			it "should add fees outstanding if the ticket absorbs the fee" do

			end

			it 'should add to the booking fee for every booking that is taken' do

			end

			it "should put the acount balance back to 0 and the outstanding fees to 0 when you request to transfer the funds from your account" do

			end

		end
	end
