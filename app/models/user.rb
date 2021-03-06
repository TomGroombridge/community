class User < ActiveRecord::Base
 	has_many :payments
 	has_many :courses
 	has_one :subscription
 	has_one :dashboard
 	mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def crop_avatar
    self.avatar.recreate_versions! if crop_x.present?
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  def balance
    @all_payments = Payment.all.select{|payment| payment.company_id == self.id }
    @payments = @all_payments.select {|payment| payment.deposited == false}
    @price = @payments.map do |p|
      if p.manually_added == false
        p.profit
      else
        0
      end
    end
    @price.inject {|sum, n| sum += n }
  end

  def all_fees
    @all_payments = Payment.all.select{|payment| payment.company_id == self.id }
    @payments = @all_payments.select {|payment| payment.deposited == false}
    @price = @payments.map do |p|
      if p.manually_added == false
        p.ticket_fee
      else
        0.00
      end
    end
    @price.inject {|sum, n| sum += n }
  end

  def outstanding_fees
    @all_payments = Payment.all.select{|payment| payment.company_id == self.id }
    @payments = @all_payments.select {|payment| payment.deposited == false}
    @price = @payments.map do |p|
      if p.manually_added == false
        p.company_fee
      else
        0.00
      end
    end
    @price.inject {|sum, n| sum += n }
  end

end
