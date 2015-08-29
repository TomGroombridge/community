require 'spec_helper'
	# require_relative '../test_helpers/create_case_helper_spec'

	# RSpec.configure do |c|
	#   c.include CreateCaseHelper
	# end


	 describe "sign up" do
	 		context "given a home page" do
	 			it "should be able to navigate to the sign up page and sign up " do
	 				visit "/"
	 				click_link "signUp"
	 				save_and_open_page
	 				fill_in "user_first_name", with: "Tom"
	 				fill_in "user_last_name", with: "Groombridge"
	 			end
	 		end
	 end