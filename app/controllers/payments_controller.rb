class PaymentsController < ApplicationController

  def new
    # @payment = Payment.new
    @ticket = Ticket.find(params[:id])
    @payment = @ticket.payments.build
    @payment.user = current_user
    @payment.course_date_id = @ticket.course_date.id
    if @ticket.number_of_dates > 1
      @entry = @ticket.entries.build
      raise @entry.inspect
    end
  end

  def create
    @payment = Payment.new(payment_params)
    raise @date_selections.inspect
    @payment.company_id = @payment.ticket.course_date.course.user_id
    @payment.course_date_id = @payment.ticket.course_date.id
    @course = @payment.ticket.course_date.course
    @payment.user = current_user
    if @payment.save_with_payment(payment_params)
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
    params.require(:payment).permit(:course_date_id, :email, :course_id, :stripe_card_token, :full_name, :mobile_number, :special_request, :quantity, :ticket_id, :course_date_id, :company_id)
  end


end
