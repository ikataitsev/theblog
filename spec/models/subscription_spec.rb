require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it "is valid with email and token" do
    s = Subscription.new email: "foo@bar.com", token: "abc-123-token"
    expect(s).to be_valid
  end
end
