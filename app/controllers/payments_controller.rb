class PaymentsController < ApplicationController

  def new
    @ticket = Ticket.find(params[:id])
    @payment = @ticket.payments.build
    if @ticket.number_of_dates > 1
      @entry = Entry.find(params[:entry_id])
      @payment.entry_id = @entry.id
      @entry.ticket_id = @entry.id
      # raise @payment.inspect
      # raise @payment.ticket.inspect
    else
      @entry = Entry.create(params[:entry])
      @payment.entry_id = @entry.id
      # raise @entry_selections.inspect
    end
    @payment.user = current_user
    @payment.course_date_id = @ticket.course_date.id
    # raise @payment.inspect
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.ticket.number_of_dates <= 1
      @entry_selections = EntrySelection.create(params[:entry_selection])
      @entry_selections.update_attributes(:entry_id => @payment.entry.id, :course_date_id => @payment.ticket.course_date.id)
    end
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
    params.require(:payment).permit(:course_date_id, :email, :course_id, :stripe_card_token, :full_name, :mobile_number, :special_request, :quantity, :ticket_id, :course_date_id, :company_id, :entry_id)
  end


end
