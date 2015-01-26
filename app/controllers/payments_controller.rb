class PaymentsController < ApplicationController
	
	def new  
    @course = CourseDate.find(params[:id])    
    @payment = @course.payments.build        
		@payment.user = current_user
	  @user = @payment.user	       
  end

  def create      
    @payment = Payment.new(params[:payment].permit(:user_id, :course_date_id, :email, :course_id, :stripe_card_token, :price, :full_name))  	            
    if @payment.save_with_payment       
    	@payment.course_date.update_attribute(:quantity, @payment.course_date.quantity - 1)		      
      redirect_to @payment, :notice => "Thank you for paying!"
    else
      render :new
    end
  end

  def show
    @payment = Payment.find(params[:id])  
  end

end
