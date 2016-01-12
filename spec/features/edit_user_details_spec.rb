require 'spec_helper'
require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe 'Editing user details' do

		before(:each) do
			@user = create(:user)
			user_sign_in
			visit "/users/#{@user.id}/edit"
		end

		context 'given a signed in user' do

			it 'should allow you to edit your first name' do
				fill_in "user[first_name]", :with  => "James"
				click_button "Update User"
				expect(current_path).to eq("/dashboard")
				@user.reload
				expect(@user.first_name).to eq "James"
			end

			it 'should allow you to edit your last name' do
				fill_in "user[last_name]", :with  => "Groombridge"
				click_button "Update User"
				expect(current_path).to eq("/dashboard")
				@user.reload
				expect(@user.last_name).to eq "Groombridge"
			end

			it 'should allow you to edit your email address' do
				fill_in "user[email]", :with  => "james@groombridge.com"
				click_button "Update User"
				expect(current_path).to eq("/dashboard")
				@user.reload
				expect(@user.email).to eq "james@groombridge.com"
			end

			it 'should allow you to edit your company name' do
				fill_in "user[company_name]", :with  => "Australia Co"
				click_button "Update User"
				expect(current_path).to eq("/dashboard")
				@user.reload
				expect(@user.company_name).to eq "Australia Co"
			end

			it 'should allow you to edit your contact number' do
				fill_in "user[contact_number]", :with  => "07540 726507"
				click_button "Update User"
				expect(current_path).to eq("/dashboard")
				@user.reload
				expect(@user.contact_number).to eq "07540 726507"
			end

			it "should allow you to edit 'about your company'" do
				fill_in "user[description]", :with  => "This is a great company full of great people"
				click_button "Update User"
				expect(current_path).to eq("/dashboard")
				@user.reload
				expect(@user.description).to eq "This is a great company full of great people"
			end

			it 'should allow you to edit your facebook handle' do
				fill_in "user[facebook]", :with  => "JamesGroombridge"
				click_button "Update User"
				expect(current_path).to eq("/dashboard")
				@user.reload
				expect(@user.facebook).to eq "JamesGroombridge"
			end

			it 'should allow you to edit your twitter handle' do
				fill_in "user[twitter]", :with  => "JamesGroombridge"
				click_button "Update User"
				expect(current_path).to eq("/dashboard")
				@user.reload
				expect(@user.twitter).to eq "JamesGroombridge"
			end

			it 'should allow you to edit your instagram handle' do
				fill_in "user[instagram]", :with  => "JamesGroombridge"
				click_button "Update User"
				expect(current_path).to eq("/dashboard")
				@user.reload
				expect(@user.instagram).to eq "JamesGroombridge"
			end

			it 'should allow you to edit your company website' do
				fill_in "user[company_website]", :with  => "James.com"
				click_button "Update User"
				expect(current_path).to eq("/dashboard")
				@user.reload
				expect(@user.company_website).to eq "James.com"
			end

			xit 'should allow you to edit your company logo' do
				fill_in "user[first_name]", :with  => "James"
				click_button "Update User"
				expect(current_path).to eq("/dashboard")
				@user.reload
				expect(@user.first_name).to eq "James"
			end


		end

	end