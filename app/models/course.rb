class Course < ActiveRecord::Base
	belongs_to :user
	has_many :users
  has_many :course_addresses
  accepts_nested_attributes_for :course_addresses

  mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar
  has_many :course_dates, dependent: :destroy
  accepts_nested_attributes_for :course_dates
  # validates :name, presence: true

  def crop_avatar
    self.avatar.recreate_versions! if crop_x.present?
  end

 	def check_last_bookings
 		tomorrow_date = DateTime.now + 1
 		tomorrow = tomorrow_date.strftime("%d/%m/%Y")
 	end

  def check_price(price)
    if price.to_s.include? "."
      raise hello
    else
      raise goodbye
    end
  end

  def upcoming_date
    active_course_dates = self.course_dates.select { |num|  num.start_date_time > DateTime.now }
    sort_dates = active_course_dates.sort_by! {|obj| obj.start_date_time}
    sort_dates.first
  end

  def upcoming_dates
    active_course_dates = self.course_dates.select { |num|  num.start_date_time > DateTime.now }
    sort_dates = active_course_dates.sort_by! {|obj| obj.start_date_time}
  end

  def previous_dates
    unactive_course_dates = self.course_dates.select { |num|  num.start_date_time < DateTime.now  }
    sort_dates = unactive_course_dates.sort_by! {|obj| obj.start_date_time}
    sort_dates.reverse
  end

  def unsold_dates
    active_course_dates = self.course_dates.select { |num|  num.start_date_time > DateTime.now && num.not_full }
    sort_dates = active_course_dates.sort_by! {|obj| obj.start_date_time}
  end

  def address
    course = ""
    course_addresses.each do |address|
      course << address.address1 + ', ' + address.address2  + ', ' + address.postcode
    end
    course
  end

  def upcoming_date_price
    self.upcoming_date.tickets.first.price
  end

end

