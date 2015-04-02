class PaymentsController < ApplicationController

  def new
    @course_date = CourseDate.find(params[:id])
    @payment = @course_date.payments.build
    @payment.user = current_user
  end

  def create
    @payment = Payment.new(payment_params)
    @course = @payment.course_date.course
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
    params.require(:payment).permit(:course_date_id, :email, :course_id, :stripe_card_token, :full_name, :mobile_number, :special_request, :quantity)
  end


end
