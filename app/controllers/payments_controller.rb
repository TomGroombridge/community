class PaymentsController < ApplicationController
  before_action :fetch_and_authorize_ticket, :except => [:index, :show]

  def new
    @payment = Payment.new
    # raise @ticket.inspect
    @order = @ticket.orders.build
    @order.ticket_id = @ticket.id
    @payment.ticket_id = @ticket.id
    @payment.bookings.build
    @payment.bookings.each {|booking| @ticket.number_of_dates.times{booking.booking_dates.build}}
    @order.ticket_id = @ticket.id
    @course_dates = @ticket.course_date.course.unsold_dates
    @course_dates.map do |cd|
      cd.start_time == cd.start_date_time.strftime("%A, %d %b %Y %l:%M %p")
    end
  end

  def create
    @response =  JSON.parse(params[:stripeToken])
    card_type = @response["card"]["funding"]
    # raise @response.inspect

    if card_type.to_s == "credit"
      flash[:notice] = "Sorry we do not take credit cards"
      redirect_to new_ticket_payment_path(@ticket.id)
    else
      @payment = @ticket.payments.build
      @course = @ticket.course_date.course
      # raise @payment.inspect
      if @payment.save_with_payment(payment_params)
        @order = @ticket.orders.create
        @payment.order_id = @order.id
        raise @payment.bookings.inspect
        @payment.company_id = @ticket.course_date.course.user_id
        @payment.user = current_user
        @payment.bookings.each{|booking| booking.update_attributes(:order_id => @payment.order.id)}
        # @payment.save if Rails.env.test?
        redirect_to payment_path(@payment.id)
      else
        raise @payment.inspect
        flash[:notice] = "Something went wrong please try again."
        render :new
      end
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
    params.require(:payment).permit(:course_date_id, :email, :price, :ticket_price, :ticket_fee, :course_id, :stripe_card_token, :full_name, :mobile_number, :special_request, :quantity, :ticket_id, :course_date_id, :company_id, :amount_paid, :order_id, bookings_attributes:[ :booking_id, :course_date_id, :name, :email, :contact_number, :special_request, :age, booking_dates_attributes:[:course_date_id]])
  end


end
