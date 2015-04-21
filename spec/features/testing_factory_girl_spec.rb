require 'spec_helper'

describe "signing in as a user" do

  before do
  	create(:user)
  end



  it 'should redirect to the home page once signed in' do
    visit '/users/sign_up'
    fill_in('signUpEmail', :with => 'John@john.com')
    fill_in 'signUpPassword', with: '123456789'
    fill_in 'signUpPasswordConfirmation', with: '123456789'
    click_button 'Sign Up'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Dashboard'
  end

  it 'should be able to login' do
    visit home_path
    click_link("Sign in")
    fill_in('user_email', :with => 'tom@t.com')
    fill_in('user_password', :with => '123456789')
    click_button 'signIn'
    expect(page).to have_content 'Dashboard'
  end

end



describe "a admin user" do
	let(:james) { create(:admin) }

	before do
		create(:admin)
	end

	# it "should be able to access the admin board" do
	# 	visit '/'
 #    click_link('SIGN IN')
 #    fill_in 'Email', with: 'james@j.com'
 #    fill_in 'Password', with: '123456789'
 #    click_button 'Log in'
 #    click_link('DASHBOARD')
	# end

end