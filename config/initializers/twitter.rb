TWITTER_CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key = Rails.application.secrets.consumer_key_api
  config.consumer_secret = Rails.application.secrets.consumer_secret_api
  config.access_token = Rails.application.secrets.access_token
  config.access_token_secret = Rails.application.secrets.access_token_secret
end