require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with email and text" do
    comment = Comment.new email: "hello@foo.com", text: "world"
    expect(comment).to be_valid
  end

  it "is invalid withour either of email or text" do
    comment = Comment.new text: "hello"
    expect(comment).to be_invalid
  end

  it "is invalid with invalid email" do
    comment = Comment.new email: "invalid@", text: "hey"
    expect(comment).to be_invalid

    comment = Comment.new email: "valid@foo.com", text: "hey"
    expect(comment).to be_valid
  end
end
