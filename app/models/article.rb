class Article < ActiveRecord::Base
  scope :recent, -> { order('created_at DESC') }

  after_create :notify_subscribers

  has_many :comments

  validates :title, :body, presence: true

  def rendered_body
    markdown.render body
  end

  private

  def notify_subscribers
    logger.info "notify_subscribers"
    Subscription.notify_all self
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
  end
end
