User.create!([
  {email: "groombridgetom@gmail.com", password:"testing123", remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-08-18 17:12:48", last_sign_in_at: "2015-08-08 13:31:31", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", contact_number: "09382423409", first_name: "Tom", last_name: "Groombridge", description: nil, company_name: "hello world", subscription_added: false, company_website: nil, facebook: nil, twitter: nil, instagram: nil, google: nil, pinterest: nil, admin: true, avatar: nil, fees: "0.0"}
])
Course.create!([
  {name: "Learn to bake bread", description: "<p>Come and learn how to bake bread</p>\r\n", user_id: 1, blurb: nil, what_to_wear: "nothing special", what_to_bring: "nothing special", experience: "none", avatar: "972126_10201133739614523_924525143_n.jpg", category: "arts", age_needed: false, private: false}
])
CourseAddress.create!([
  {address1: "Rye House", address2: "Maces Hill", city: "Cirencester", county: nil, postcode: "GL7 7AB", course_id: 1, longitude: -2.0132634, latitude: 51.7451572}
])
CourseDate.create!([
  {course_id: 1, active: true, start_date: "#{(DateTime.now + 2.days).strftime("%Y-%m-%d")}", start_time: "2020-01-01 19:49:15", end_date: "#{(DateTime.now + 3.days).strftime("%Y-%m-%d")}", end_time: "2020-01-01 13:33:00"},
  {course_id: 1, active: true, start_date: "#{(DateTime.now + 3.days).strftime("%Y-%m-%d")}", start_time: "2020-01-01 19:49:15", end_date: "#{(DateTime.now + 3.days).strftime("%Y-%m-%d")}", end_time: "2020-01-01 13:33:00"},
  {course_id: 1, active: true, start_date: "#{(DateTime.now + 4.days).strftime("%Y-%m-%d")}", start_time: "2020-01-01 19:49:15", end_date: "#{(DateTime.now + 3.days).strftime("%Y-%m-%d")}", end_time: "2020-01-01 13:36:00"},
  {course_id: 1, active: true, start_date: "#{(DateTime.now + 5.days).strftime("%Y-%m-%d")}", start_time: "2020-01-01 19:49:15", end_date: "#{(DateTime.now + 3.days).strftime("%Y-%m-%d")}", end_time: "2020-01-01 13:43:00"},
  {course_id: 1, active: true, start_date: "#{(DateTime.now + 6.days).strftime("%Y-%m-%d")}", start_time: "2020-01-01 19:49:15", end_date: "#{(DateTime.now + 3.days).strftime("%Y-%m-%d")}", end_time: "2020-01-01 13:33:00"},
  {course_id: 1, active: true, start_date: "#{(DateTime.now + 7.days).strftime("%Y-%m-%d")}", start_time: "2020-01-01 19:49:15", end_date: "#{(DateTime.now + 3.days).strftime("%Y-%m-%d")}", end_time: "2020-01-01 13:36:00"},
  {course_id: 1, active: true, start_date: "#{(DateTime.now + 8.days).strftime("%Y-%m-%d")}", start_time: "2020-01-01 19:49:15", end_date: "#{(DateTime.now + 3.days).strftime("%Y-%m-%d")}", end_time: "2020-01-01 13:43:00"},
  {course_id: 1, active: true, start_date: "#{(DateTime.now + 9.days).strftime("%Y-%m-%d")}", start_time: "2020-01-01 19:49:15", end_date: "#{(DateTime.now + 3.days).strftime("%Y-%m-%d")}", end_time: "2020-01-01 13:33:00"},
  {course_id: 1, active: true, start_date: "#{(DateTime.now + 10.days).strftime("%Y-%m-%d")}", start_time: "2020-01-01 19:49:15", end_date: "#{(DateTime.now + 3.days).strftime("%Y-%m-%d")}", end_time: "2020-01-01 13:36:00"},
  {course_id: 1, active: true, start_date: "#{(DateTime.now + 11.days).strftime("%Y-%m-%d")}", start_time: "2020-01-01 19:49:15", end_date: "#{(DateTime.now + 3.days).strftime("%Y-%m-%d")}", end_time: "2020-01-01 13:43:00"}
])
Ticket.create!([
  {name: "Normal Tickets", price: "10.0", course_date_id: 1, quantity: 10, absorb_fee: false, number_of_dates: 1},
  {name: "Normal Tickets", price: "10.0", course_date_id: 2, quantity: 10, absorb_fee: false, number_of_dates: 1},
  {name: "Normal Tickets", price: "10.0", course_date_id: 3, quantity: 10, absorb_fee: false, number_of_dates: 1},
  {name: "Normal Tickets", price: "10.0", course_date_id: 4, quantity: 10, absorb_fee: false, number_of_dates: 1},
  {name: "Normal Tickets", price: "10.0", course_date_id: 5, quantity: 10, absorb_fee: false, number_of_dates: 1},
  {name: "Normal Tickets", price: "10.0", course_date_id: 6, quantity: 10, absorb_fee: false, number_of_dates: 1},
  {name: "Normal Tickets", price: "10.0", course_date_id: 7, quantity: 10, absorb_fee: false, number_of_dates: 1},
  {name: "Normal Tickets", price: "10.0", course_date_id: 8, quantity: 10, absorb_fee: false, number_of_dates: 1},
  {name: "Normal Tickets", price: "10.0", course_date_id: 9, quantity: 10, absorb_fee: false, number_of_dates: 1},
  {name: "Normal Tickets", price: "10.0", course_date_id: 10, quantity: 10, absorb_fee: false, number_of_dates: 1},
])
