FactoryGirl.define do

	factory :ticket do
	  name 'normal ticket'
    price 50.00
    quantity 10
    absorb_fee false
    number_of_dates 1
  end

  factory :course_date do
    start_date "#{DateTime.tomorrow}"
  	start_time "#{DateTime.now}"
  	end_date "#{DateTime.tomorrow}"
  	end_time "#{DateTime.now}"
  	active true
	end

end