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
			end
		end
	end
