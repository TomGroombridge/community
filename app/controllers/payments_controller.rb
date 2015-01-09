class PaymentsController < ApplicationController
	
	def new    				
    @course = CourseDate.find(params[:id])    
    @payment = @course.payments.build    
		@payment.user = current_user
	  @user = @payment.user	    
  end

  def create         
    @payment = Payment.new(params[:payment].permit(:user_id, :course_date_id, :email))  	        
    raise @payment.inspect
    if @payment.save_with_payment 
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
