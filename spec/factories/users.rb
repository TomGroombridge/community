FactoryGirl.define do

  factory :user do
  	first_name 'tom'
    last_name 'groombridge'
    email 'tom@t.com'
    contact_number "01285 6452968"
    company_name "Courseiam"
    password '123456789'
    password_confirmation '123456789'
    admin true
  end

end
