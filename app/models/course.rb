class Course < ActiveRecord::Base
	belongs_to :user
	has_many :course_dates
	has_many :users		  
  has_many :course_addresses
  accepts_nested_attributes_for :course_addresses  
  accepts_nested_attributes_for :course_dates
  mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h 
  after_update :crop_avatar

  def crop_avatar
    self.avatar.recreate_versions! if crop_x.present? 
  end

 	def check_last_bookings
 		tomorrow_date = DateTime.now + 1
 		tomorrow = tomorrow_date.strftime("%m/%d/%Y") 		
 	end

  def free?
    price == nil 
  end

  def check_price(price)
    if price.to_s.include? "."
      raise hello
    else
      raise goodbye
    end
  end

  def upcoming_date
    active_course_dates = self.course_dates.select { |num|  num.active?  } 
    sort_dates = active_course_dates.sort_by! {|obj| obj.start_date_time}
    sort_dates.first
  end

  def upcoming_dates
    active_course_dates = self.course_dates.select { |num|  num.active?  } 
    sort_dates = active_course_dates.sort_by! {|obj| obj.start_date_time}    
  end

  def address    
    course = ""
    course_addresses.each do |address|
      course << address.address1 + ', ' + address.address2  + ', ' + address.postcode
    end   
    course 
  end
  
end

