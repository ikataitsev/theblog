class SubscriptionsController < ApplicationController
  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.all
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to :back, notice: 'Subscription was successfully created.' }
      else
        format.html { render "articles/index" }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def unsubscribe
    if subscription = Subscription.find_by(token: params[:subscription_id])
      subscription.destroy
      respond_to do |format|
        format.html { redirect_to :root, notice: 'Subscription was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to :root, notice: "You are not subscribed. "}
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
