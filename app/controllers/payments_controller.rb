class PaymentsController < ApplicationController

  def new
    @ticket = Ticket.find(params[:id])
    @payment = @ticket.payments.build
    if @ticket.number_of_dates > 1
      @order = Order.find(params[:order_id])
      @payment.order_id = @order.id
      @order.ticket_id = @payment.ticket.id
    else
      @order = Order.create(params[:entry])
      @payment.order_id = @order.id
      @order.ticket_id = @payment.ticket.id
    end
    @payment.user = current_user
    @payment.course_date_id = @ticket.course_date.id
    # raise @payment.inspect
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.company_id = @payment.ticket.course_date.course.user_id
    @payment.course_date_id = @payment.ticket.course_date.id
    @course = @payment.ticket.course_date.course
    @payment.user = current_user
    if @payment.save_with_payment(payment_params)
      if @payment.ticket.number_of_dates <= 1
        @booking = Booking.create(params[:booking])
        @booking.update_attributes(:order_id => @payment.order.id)
        @booking_date = BookingDate.create(params[:booking_date])
        @booking_date.update_attributes(:booking_id => @booking.id, :course_date_id => @payment.ticket.course_date.id)
      end
      redirect_to @payment, :notice => "Thank you for paying!"
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
  def payment_params
    params.require(:payment).permit(:course_date_id, :email, :course_id, :stripe_card_token, :full_name, :mobile_number, :special_request, :quantity, :ticket_id, :course_date_id, :company_id, :order_id)
  end


end
