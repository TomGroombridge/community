class PaymentsController < ApplicationController
	
	def new  
    @course_date = CourseDate.find(params[:id])    
    @payment = @course_date.payments.build        
		@payment.user = current_user
	  @user = @payment.user	       
  end

  def create          
    @payment = Payment.new(params[:payment].permit(:course_date_id, :email, :course_id, :stripe_card_token, :full_name, :mobile_number, :special_request))
    @course = @payment.course_date.course    
    @payment.user = current_user

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
