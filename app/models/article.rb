class Article < ActiveRecord::Base
  after_create :notify_subscribers

  has_many :comments

  private

  def notify_subscribers
    logger.info "notify_subscribers"
    Subscription.notify_all self
  end
end
