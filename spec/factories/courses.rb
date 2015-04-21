FactoryGirl.define do

  factory :course do
  	name 'Learn to Bake Bread'
  	description 'This is a course where you will learn the basics of making bread'
  	what_to_wear "nothing special"
  	what_to_bring "nothing special"
  	experience "none"
  	id 10
  	user_id 10

  	trait :course_address do
	    address1 "Rye House"
	  	address2 "Maces Hill"
	  	city "Cirencester"
	  	postcode "GL7 7AB"
	  	course_id 10
	  end

	  trait :course_date do
	    start_date "2015-04-17"
	  	start_time "2000-01-01 10:30:00"
	  	end_date "2015-04-24"
	  	end_time "2000-01-01 10:26:00"
	  	course_id 10
	  	id 100
	  	active true
	  end

	  trait :ticket do
	    name "test"
	    quantity 20
	    price 12.00
	    absorb_fee true
	    course_date_id 100
	  end

 	end

 	factory :course_address do
  	address1 "Rye House"
  	address2 "Maces Hill"
  	city "Cirencester"
  	postcode "GL7 7AB"
  	course_id 10
 	end

 	factory :course_date do
  	start_date "2015-04-17"
  	start_time "2000-01-01 10:30:00"
  	end_date "2015-04-24"
  	end_time "2000-01-01 10:26:00"
  	course_id 10
  	id 100
  	active true
 	end


end