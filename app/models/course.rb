class Course < ActiveRecord::Base
	belongs_to :user
	has_many :course_dates
	has_many :users	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :course_addresses
  has_many :need_on_courses
  accepts_nested_attributes_for :course_addresses
  accepts_nested_attributes_for :need_on_courses
	


 	def check_last_bookings
 		tomorrow_date = DateTime.now + 1
 		tomorrow = tomorrow_date.strftime("%m/%d/%Y") 		
 	end

end

