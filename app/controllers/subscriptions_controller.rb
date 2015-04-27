class SubscriptionsController < ApplicationController

def new
  @plan = Plan.find(params[:plan_id])
  @subscription = @plan.subscriptions.build
end

def create
  @subscription = Subscription.new(params[:subscription].permit(:email, :plan_id, :stripe_card_token))
  if @subscription.save_with_payment
    redirect_to @subscription
    current_user.update_column(:subscription_added, true)
  else
    render :new
  end
end

def show
  @subscription = Subscription.find(params[:id])
end



end
