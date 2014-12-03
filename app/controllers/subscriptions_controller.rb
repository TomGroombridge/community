class SubscriptionsController < ApplicationController

def new
  @plan = Plan.find(params[:plan_id])      
  @subscription = @plan.subscriptions.build 
end

def create    
  @subscription = Subscription.new(params[:subscription].permit(:email, :plan_id, :stripe_card_token))
  if @subscription.save_with_payment
    redirect_to @subscription, :notice => "Thank you for subscribing!"
    current_course_provider.update_column(:subscription_added, true)    
  else
    render :new, :notice => "Failed"
  end
end

def show
  @subscription = Subscription.find(params[:id])
end



end
