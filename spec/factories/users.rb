FactoryGirl.define do
  factory :user do
  	first_name 'tom'
  	last_name 'groombridge'
  	email 'tom@t.com'
  	password '123456789'
  	password_confirmation '123456789'
  end

  factory :admin, class: User do
  	first_name 'james'
  	last_name 'groombridge'
  	email 'james@j.com'
  	password '123456789'
  	password_confirmation '123456789'
  	admin true
    company_name "courseiam"
    id 10
  end
end
