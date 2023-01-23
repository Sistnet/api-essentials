require 'sidekiq/web'
require 'sidekiq-cron'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/0') }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/0') }
end

#Sidekiq::Web.set :session_secret, Rails.application.secret_key_base
# Sidekiq::Web.set :sessions, Rails.application.config.session_options

Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key:  Rails.application.secret_key_base