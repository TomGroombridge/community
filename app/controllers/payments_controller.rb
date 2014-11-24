class PaymentsController < ApplicationController
	
	def new
    @course = Course.find(params[:id])
    @payment = @course.payments.build
  end


  def create
    @payment = Payment.new(params[:payment].permit(:email, :course_id))  	
    if @payment.save
      redirect_to @payment, :notice => "Thank you for paying!"
    else
      render :new
    end
  end

  def show
    @payment = Payment.find(params[:id])  
  end

end
