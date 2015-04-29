require 'spec_helper'

describe "signing in as a user" do

  let(:tom) { create(:user) }

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

  it "should be able to create a course" do
    visit home_path
    click_link("Sign in")
    fill_in('user_email', :with => 'tom@t.com')
    fill_in('user_password', :with => '123456789')
    click_button 'signIn'
    click_link "Add Course"
    fill_in('course_name', :with => 'Learn to bake bread')
    fill_in('description', :with => 'Learn to bake bread')
    fill_in('course_what_to_wear', :with => 'Nothing')
    fill_in('course_what_to_bring', :with => 'Nothing')
    fill_in('course_experience', :with => 'None')
    fill_in('course_course_addresses_attributes_0_address1', :with => 'Rye House')
    fill_in('course_course_addresses_attributes_0_address2', :with => 'Maces Hill')
    fill_in('course_course_addresses_attributes_0_city', :with => 'Cirencester')
    fill_in('course_course_addresses_attributes_0_postcode', :with => 'GL7 7AB')
    fill_in('course_course_dates_attributes_0_tickets_attributes_0_name', :with => 'Normal Price')
    fill_in('course_course_dates_attributes_0_tickets_attributes_0_price', :with => 10.00)
    fill_in('course_course_dates_attributes_0_tickets_attributes_0_quantity', :with => 10)
    fill_in('course_course_dates_attributes_0_start_date', :with => "2015/05/05")
    click_button 'courseSubmit'
    visit "/course_dates"
    expect(page).to have_content "Learn to bake bread"
  end





end
