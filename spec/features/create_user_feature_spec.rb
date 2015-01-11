require 'spec_helper'

	describe 'create a user' do 
		context 'given a sign up page' do 
			it 'should redirect a user to the home page for courses' do 
				visit "/users/sign_up"
				fill_in  'First Name', with: 'Tom'
				fill_in  'Last Name', with: 'Groombridge'
				fill_in 'Email', with: 'tom@example.com'
				fill_in 'Password', with: '123456789'
				fill_in 'Confirm Password', with: '123456789'
			end			
		end
	end