class Course < ActiveRecord::Base
	belongs_to :user
	has_many :course_dates
	has_many :users	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :course_addresses
  accepts_nested_attributes_for :course_addresses
  validates_presence_of :name	


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
    sort_dates = active_course_dates.sort_by! {|obj| obj.start_date}
    sort_dates.first
  end

  def upcoming_dates
    active_course_dates = self.course_dates.select { |num|  num.active?  } 
    sort_dates = active_course_dates.sort_by! {|obj| obj.start_date}    
  end
  
end

