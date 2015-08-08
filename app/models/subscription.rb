require "securerandom"

class Subscription < ActiveRecord::Base
  def self.notify_all article
    find_each do |subscription|
      SubscriptionMailer.notify(subscription, article).deliver_later
    end
  end

  before_validation :set_token, on: :create
  after_create      :send_welcome_email

  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ } # stolen from devise
  validates :token, presence: true

  private

  def set_token
    self.token ||= SecureRandom.urlsafe_base64 64
  end

  def send_welcome_email
    SubscriptionMailer.welcome(self).deliver_later
  end
end
