require 'spec_helper'

	describe 'create a user' do 
		context 'given a sign up page' do 
			it 'should redirect a user to the home page for courses' do 
				visit "/users/sign_up"				
				save_and_open_page
				within("#new_user") do
					fill_in 'first_name', with: 'Tom'
					fill_in 'last_name', with: 'Groombridge'
					fill_in 'email', with: 'tom@example.com'
					fill_in 'password', with: '123456789'
					fill_in 'confirm_password', with: '123456789'
					click_button 'SUBMIT'
					expect(current_path).to eq '/'
				end				
			end			
		end
	end