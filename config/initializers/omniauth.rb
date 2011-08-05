Rails.application.config.middleware.use OmniAuth::Builder do
  require 'openid/store/filesystem'
  
  provider :facebook, APP_CONFIG['facebook_app_id'], APP_CONFIG['facebook_app_secret']
  # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end