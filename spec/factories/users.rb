FactoryGirl.define do
  factory :user do
  	first_name 'tom'
  	last_name 'groombridge'
  	email 'tom@t.com'
  	password '123456789'
  	password_confirmation '123456789'  	
  end
end
