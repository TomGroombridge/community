class PaymentsController < ApplicationController
  before_action :fetch_and_authorize_ticket, :except => [:index, :show]

  def new
    @payment = Payment.new
    @order = @ticket.orders.build
    @order.ticket_id = @ticket.id
    @payment.ticket_id = @ticket.id
    @payment.bookings.build
    @payment.bookings.each {|booking| @ticket.number_of_dates.times{booking.booking_dates.build}}
    @order.ticket_id = @ticket.id
    @course_dates = @ticket.course_date.course.unsold_dates
    @course_dates.map do |cd|
      cd.start_time ==  cd.start_date_time.strftime("%A, %d %b %Y %l:%M %p")
    end
  end

  def create
    @payment = Payment.new(payment_params)
    @order = Order.create(params[:order])
    @order.update_attributes(:ticket_id => @payment.ticket_id)
    @payment.order_id = @order.id
    @payment.company_id = @payment.ticket.course_date.course.user_id
    @course = @payment.ticket.course_date.course
    @payment.user = current_user
    if @payment.save_with_payment(payment_params)
      if @payment.ticket.number_of_dates == 1
        # @booking = @payment.bookings.last
        # @booking_date = BookingDate.create(params[:booking_date])
        # @booking_date.update_attributes(:booking_id => @booking.id, :course_date_id => @payment.ticket.course_date.id)
        @payment.bookings.each{|booking| booking.update_attributes(:order_id => @payment.order.id)}
      else
        @payment.bookings.each{|booking| booking.update_attributes(:order_id => @payment.order.id)}
      end
      redirect_to @payment
    else
      render :new
    end
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  private

  def fetch_and_authorize_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def payment_params
    params.require(:payment).permit(:course_date_id, :email, :price, :course_id, :stripe_card_token, :full_name, :mobile_number, :special_request, :quantity, :ticket_id, :course_date_id, :company_id, :amount_paid, :order_id, bookings_attributes:[ :booking_id, :course_date_id, :name, :email, :contact_number, :special_request, booking_dates_attributes:[:course_date_id]])
  end


end
