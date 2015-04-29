require 'spec_helper'

	describe 'create courses' do

		before do
			create(:course)
		end

		it 'should be able to create a course' do
			visit "/courses/2"
			click_link 'bookNow'
			click_link 'Book Now'
			fill_in('payment_bookings_attributes_0_name', :with => 'Tom Groombridge')
			fill_in('payment_bookings_attributes_0_email', :with => 'groombridgetom@gmail.com')
			fill_in('payment_bookings_attributes_0_contact_number', :with => '07540 726507')
			fill_in('card_number', :with => '4242 4242 4242 4242')
			select('9', :from => 'card_month')
			select('2016', :from => 'card_year')
			fill_in('security_code', :with => '321')
			click_button 'Send Payment'
			expect(page).to have_content("Thank-you for booking with Courseiam")

		end


		# it 'should display the new course in the list of courses' do
		# 	visit "/course_dates"
		# 	expect(page).to have_content 'Learn to Bake Bread'
		# end



end