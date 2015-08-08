require 'rails_helper'

RSpec.describe Article, type: :model do
  it "is valid with title and body" do
    article = Article.new title: "hello", body: "world"
    expect(article).to be_valid
  end

  it "is invalid withour either of title or body" do
    article = Article.new title: "hello"
    expect(article).to be_invalid
  end

  it "notifies subscribers about its birth" do
    article = Article.new title: "hello", body: "world"
    expect(article).to receive(:notify_subscribers)
    article.save!
  end
end
