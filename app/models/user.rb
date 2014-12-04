class User < ActiveRecord::Base
 	has_many :payments  
 	has_many :courses
 	has_one :subscription
 	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
 	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
