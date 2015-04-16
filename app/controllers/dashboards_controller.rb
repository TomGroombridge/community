class DashboardsController < ApplicationController
	before_action :fetch_and_authorize_user

	def show
		@all_courses = @user.courses
		@active_courses = @all_courses.all.includes(:course_dates).select do |course|
			course.course_dates.any?(&:active?)
		end
		@course_dates = []
		@active_courses.each do |course|
			course.course_dates.each do |date|
					if date.active?
						@course_dates << date
					else
					end
			end
		end
		@course_dates.sort_by!{|date| date.start_date_time}
		@payments = Payment.all.select{|payment| payment.company_id == @user.id }
		if @payments.count > 0
			@price = @payments.map do |p|
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
    if params[:search]
      @weekly_bookings = Booking.search(params[:search]).order("created_at DESC")
    else
      @weekly_bookings = Booking.all.order('created_at DESC')
    end
	end

	private

	def fetch_and_authorize_user
    @user = current_user
  end

end
