class SubscriptionMailer < ApplicationMailer
  def welcome subscription
    @subscription = subscription
    mail to: subscription.email, subject: "You are now subscribed to the blog!"
  end

  def notify subscription, article
    @subscription = subscription
    @article = article
    mail to: subscription.email, subject: "Check out new article: #{article.title}"
  end
end
