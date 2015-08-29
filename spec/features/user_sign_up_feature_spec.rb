require 'spec_helper'

	describe "sign up" do

		context "given a home page" do

			it "should be able to navigate to the sign up page and sign up with correct details" do
				visit "/"
				click_link "signUp"
				fill_in "user_first_name", with: "Tom"
				fill_in "user_last_name", with: "Groombridge"
				fill_in "signUpEmail", with: "groombridegtom@gmail.com"
				fill_in "user_contact_number", with: "07777 777777"
				fill_in "signUpPassword", with: "123456789"
				fill_in "signUpPasswordConfirmation", with: "123456789"
				fill_in "user_company_name", with: "Courseiam"
				click_button "Sign Up"
				expect(current_path).to eq("/")
				expect(page).to have_content("Add Course")
			end

		end

	end