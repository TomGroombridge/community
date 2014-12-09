class PaymentsController < ApplicationController
	
	def new    				
    @course = Course.find(params[:id])
    @payment = @course.payments.build
		@payment.user = current_user || current_course_provider || current_member
		@user = @payment.user	
    @course_dates = []
    @course_dates = @course.course_dates.each do |date|
      @course_dates << date.course_id
    end
    
  end

  def create         
    @payment = Payment.new(params[:payment].permit(:course_id, :user_id, :course_date_id, :email))  	        
    if @payment.save_with_payment 
      raise @payment.inspect
    	@payment.course.update_attribute(:quantity, @payment.course.quantity - 1)		      
      redirect_to @payment, :notice => "Thank you for paying!"
    else
      render :new
    end
  end

  def show
    @payment = Payment.find(params[:id])  
  end

end
