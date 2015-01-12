require 'spec_helper'

describe "signing in as a user" do

	let(:tom) { create(:user) }

  before do 
  	create(:user)  	
  end



  it 'should redirect to the home page once signed in' do
    visit '/'    
    click_link('LOG IN')
    fill_in 'Email', with: 'tom@t.com'
    fill_in 'Password', with: '123456789'
    click_button 'Log in'
    expect(page).to have_content 'LOG OUT'
    expect(current_path).to eq '/'
  end

end



describe "a admin user" do 
	let(:james) { create(:admin) }

	before do 
		create(:admin)			
	end

	it "should be able to access the admin board" do 
		visit '/'    
    click_link('LOG IN')
    fill_in 'Email', with: 'james@j.com'
    fill_in 'Password', with: '123456789'
    click_button 'Log in'
    click_link('DASHBOARD')
	end
	
end