FactoryGirl.define do

  factory :user do
  	first_name 'test'
    last_name 'account'
    email 'test@account.com'
    contact_number "01285 6452968"
    company_name "Courseiam"
    password '123456789'
    password_confirmation '123456789'
    admin true
  end

end
