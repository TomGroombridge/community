require 'spec_helper'
	require_relative '../test_helpers/user_helpers_spec'


	RSpec.configure do |c|
	  c.include CreateUserHelper
	end

	describe 'Editing course details' do

		before(:each) do
			@user = create(:user)
			user_sign_in
			create_food_course
			visit "/courses/#{@course.id}/edit"
		end

		context 'given a course and a signed in user' do

			# name
			# description
			# created_at
			# updated_at
			# user_id
			# blurb
			# what_to_wear
			# what_to_bring
			# experience
			# avatar
			# category
			# age_needed
			# private

			it "should allow you to edit the course name " do
				fill_in "course[name]", :with  => "Bread Bashing"
				click_button "Update Course"
				expect(current_path).to eq("/dashboard")
				@course.reload
				expect(@course.name).to eq "Bread Bashing"
			end

			it "should allow you to edit the course description " do
				fill_in "course[description]", :with  => "Learn to Bread Bashing"
				click_button "Update Course"
				expect(current_path).to eq("/dashboard")
				@course.reload
				expect(@course.description).to eq "Learn to Bread Bashing"
			end

			it "should allow you to edit the 'what to wear' " do
				fill_in "course[name]", :with  => "Bread Bashing"
				click_button "Update Course"
				expect(current_path).to eq("/dashboard")
				@course.reload
				expect(@course.name).to eq "Bread Bashing"
			end

			it "should allow you to edit the 'what to bring' " do
				fill_in "course[what_to_wear]", :with  => "Nothing at all"
				click_button "Update Course"
				expect(current_path).to eq("/dashboard")
				@course.reload
				expect(@course.what_to_wear).to eq "Nothing at all"
			end

			it "should allow you to edit the 'experience needed'" do
				fill_in "course[experience]", :with  => "Hold a bat"
				click_button "Update Course"
				expect(current_path).to eq("/dashboard")
				@course.reload
				expect(@course.experience).to eq "Hold a bat"
			end

			it "should allow you to edit the course category " do
				fill_in "course[name]", :with  => "Bread Bashing"
				click_button "Update Course"
				expect(current_path).to eq("/dashboard")
				@course.reload
				expect(@course.name).to eq "Bread Bashing"
			end

			it "should allow you to edit the location " do
				fill_in "course[course_addresses_attributes][0][postcode]", :with  => "SW18 1NY"
				click_button "Update Course"
				expect(current_path).to eq("/dashboard")
				@course.reload
				expect(@course.course_addresses.last.postcode).to eq "SW18 1NY"
			end

		end
	end