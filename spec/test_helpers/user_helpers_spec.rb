module CreateUserHelper

	def user_sign_in
		visit "/"
		click_link "signIn"
		fill_in "user_email", with: "#{@user.email}"
		fill_in "user_password", with: "#{@user.password}"
    click_button('signIn')
	end

	def create_food_course
		@course = create(:course, name: "Learn To Bake Bread", description: "Let's make some beautiful food", user_id: @user.id, what_to_wear: "Apron", what_to_bring: "Happy Faces", category: "food")
		@course_date = create(:course_date, course_id: @course.id, start_date: (DateTime.now + 7.days), start_time: '10:00:00', end_date: (DateTime.now + 7.days), end_time: '12:00:00')
		@ticket = create(:ticket, course_date_id: @course_date.id, name: "Normal Price", price: 50.00, quantity: 10)
		@course_address = create(:course_address, address1: "Rye House", address2: "Maces Hill", city: "Gloucester", county: "Gloucestershire", postcode: "GL7 7AB", course_id: @course.id)
		# click_link('addCourse')
		# fill_in "course_name", with: "Learn To Bake Bread"
		# fill_in "course_what_to_wear", with: "Nothing special"
		# fill_in "course_what_to_bring", with: "Just yourself"
		# fill_in "course_experience", with: "No course experience needed"
		# select('Food & Drink', :from => 'course_category')
		# fill_in "course_course_addresses_attributes_0_address1", with: "Rye House"
		# fill_in "course_course_addresses_attributes_0_address2", with: "Maces Hill"
		# fill_in "course_course_addresses_attributes_0_city", with: "Cirencester"
		# fill_in "course_course_addresses_attributes_0_postcode", with: "GL7 7AB"
		# attach_file('imgInp', "#{Rails.root}/public/assets/art-and-crafts-c0117e033032f088b424e19a6edf20ce.jpg")
		# page.find('#course_course_dates_attributes_0_start_date').set("#{DateTime.tomorrow.strftime("%Y/%m/%d")}")
		# select('10', :from => 'course_course_dates_attributes_0_start_time_4i')
		# select('30', :from => 'course_course_dates_attributes_0_start_time_5i')
		# page.find('#course_course_dates_attributes_0_end_date').set("#{DateTime.tomorrow.strftime("%Y/%m/%d")}")
		# select('17', :from => 'course_course_dates_attributes_0_end_time_4i')
		# select('00', :from => 'course_course_dates_attributes_0_end_time_5i')
		# fill_in "course_course_dates_attributes_0_tickets_attributes_0_name", with: "Standard Ticket"
		# fill_in "course_course_dates_attributes_0_tickets_attributes_0_price", with: "75.00"
		# fill_in "course_course_dates_attributes_0_tickets_attributes_0_quantity", with: "10"
		# click_button("Create Course")
	end

	def make_a_booking
		visit "/courses/#{@course.id}"
		click_link('bookNow')
		click_link('bookDate')
		fill_in 'cardName', with: "Tom Groombridge"
		fill_in 'card_number', with: '4242424242424242'
		select '1 - January', from: 'card_month'
		select '2016', from: 'card_year'
		fill_in 'card_code', with: '444'
		click_button('Send Payment')
	end

	def create_course_with_date_and_ticket
		@course = create(:course) do |course|
			@course_date = course.course_dates.create(attributes_for(:course_date))
		end
		@ticket = @course_date.tickets.create(attributes_for(:ticket))
	end


	def create_booking
		@booking = create(:booking) do |booking|
			@booking_date = booking.booking_dates.create(attributes_for(:booking_date, course_date_id: @course_date.id))
		end
	end


end