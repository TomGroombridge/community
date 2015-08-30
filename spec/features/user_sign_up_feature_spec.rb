require 'spec_helper'

	describe "sign up" do

		context "given a home page" do
			before(:each) do
				@user = create(:user)
			end

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
				expect(current_path).to eq("/dashboard")
				expect(page).to have_content("#{@user.company_name}")
			end

			it "should be able to sign in" do
				visit "/"
				click_link "signIn"
				fill_in "user_email", with: "test@account.com"
				fill_in "user_password", with: "123456789"
		    click_button('signIn')
		    expect(page).to have_content("#{@user.company_name}")
		    expect(current_path).to eq("/dashboard")
			end

		end

	end