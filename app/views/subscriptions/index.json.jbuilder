json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :email, :token
  json.url subscription_url(subscription, format: :json)
end
