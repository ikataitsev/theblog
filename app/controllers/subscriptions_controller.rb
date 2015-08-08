class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
  end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      redirect_to :root, notice: 'Your are now subscribed to the Blog. Check your inbox!'
    else
      flash[:notice] = "Sorry, but couldn't subscribe you due to: #{@subscription.errors.full_messages.join(', ')}"
      redirect_to :root
    end
  end

  def unsubscribe
    if subscription = Subscription.find_by(token: params[:subscription_id])
      subscription.destroy
      redirect_to :root, notice: 'Subscription was successfully destroyed.'
    else
      redirect_to :root, notice: "You are not subscribed."
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
