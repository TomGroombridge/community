FactoryGirl.define do
  factory :course do
  	name 'Learn to Bake Bread'
  	description 'This is a course where you will learn the basics of making bread'  	
  	price 50 
  	id 1 	  	
 	end

 	factory :course_date do
  	dates { rand(1..100).days.from_now }
  	id 1 	  	
  	course_id 1
 	end
end