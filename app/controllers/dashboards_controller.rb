class DashboardsController < ApplicationController
	before_action :fetch_and_authorize_user

	def show
		@all_courses = @user.courses
		@active_courses = @all_courses.all.includes(:course_dates)
		@course_dates = []
		@active_courses.each do |course|
			course.course_dates.each do |date|
				if date.start_date_time > DateTime.now
					@course_dates << date
				end
			end
		end
    @all_dates =  CourseDate.all.select {|n| n.course.user.id == @user.id}
		@course_dates.sort_by!{|date| date.start_date_time}
		@company_payments = Payment.all.select{|payment| payment.company_id == @user.id }
    @undeposited_payments = @company_payments.select {|payment| payment.deposited == false}
		if @undeposited_payments.count > 0
			@price = @undeposited_payments.map do |p|
				if p.manually_added == false
					p.price
				else
					0
				end
			end
			@revenue = @price.inject {|sum, n| sum += n }
		else
			@revenue = 0
			@monthly_payments = []
		end
	end

	def transactions
		@payments = Payment.all.select{|payment| payment.company_id == @user.id }
		@payments = @payments.compact
		@weekly_payments = @payments.select {|n| n.created_at >= 1.week.ago}
		@monthly_payments = @payments.select {|n| n.created_at >= 1.month.ago}
	end

	def weeks_transactions_csv
		csv_string = CSV.generate do |csv|
      csv << ['First name', 'Last name', 'Email']
      @payments = Payment.all.select{|payment| payment.company_id == @user.id }
      @weekly_payments = @payments.select {|n| n.created_at >= 1.week.ago}
      @payments = @weekly_payments.map do |payment|
      	payment
      end
      @payments.each do |payment|
        client_data = []
        client_data << payment.price
        client_data << payment.booking_fee
        client_data << payment.created_at.strftime("%A, %d %b %Y %l:%M %p")
        csv << client_data
      end
    end
    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = 'attachment; filename=emails.csv'
        render text: csv_string
      end
    end
	end

	def months_transactions_csv
		csv_string = CSV.generate do |csv|
      csv << ['First name', 'Last name', 'Email']
      @payments = Payment.all.select{|payment| payment.company_id == @user.id }
      @monthly_payments = @payments.select {|n| n.created_at >= 1.month.ago}
      @payments = @monthly_payments.map do |payment|
      	payment
      end
      @payments.each do |payment|
        client_data = []
        client_data << payment.price
        client_data << payment.booking_fee
        client_data << payment.created_at.strftime("%A, %d %b %Y %l:%M %p")
        csv << client_data
      end
    end
    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = 'attachment; filename=emails.csv'
        render text: csv_string
      end
    end
	end

	def all_transactions_csv
		csv_string = CSV.generate do |csv|
      csv << ['First name', 'Last name', 'Email']
      @payments = Payment.all.select{|payment| payment.company_id == @user.id }
      @payments = @payments.map do |payment|
      	payment
      end
      @payments.each do |payment|
        client_data = []
        client_data << payment.price
        client_data << payment.booking_fee
        client_data << payment.created_at.strftime("%A, %d %b %Y %l:%M %p")
        csv << client_data
      end
    end
    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = 'attachment; filename=emails.csv'
        render text: csv_string
      end
    end
	end

	def bookings
		@bookings = Booking.all.select{|booking| booking.payment.company_id == @user.id }
		@weekly_bookings = @bookings.select {|n| n.created_at >= 1.week.ago}
    @monthly_bookings = @bookings.select {|n| n.created_at >= 1.month.ago}
    if params[:search]
      @bookings = Booking.search(params[:search]).order("created_at DESC")
    else
      @bookings = Booking.all.order('created_at DESC')
    end
	end

  def withdraw
    @company_payments = Payment.all.select{|booking| booking.company_id == @user.id }
    @undeposited_payments = @company_payments.select {|payment| payment.deposited == false}
    DashboardMailer.withdraw_payments(@user).deliver!
    @undeposited_payments.each do |payment|
      payment.update_attributes(:deposited => true)
    end
    @user.update_attributes(:fees => 0.00)
    flash[:notice] = 'Successfully withdraw'
    redirect_to dashboard_path
  end

	private

	def fetch_and_authorize_user
    @user = current_user
  end

end
