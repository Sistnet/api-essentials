# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq/cron/web'

if Rails.env.production?
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username),
                                                ::Digest::SHA256.hexdigest(ENV.fetch('SIDEKIQ_USERNAME', nil))) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password),
                                                  ::Digest::SHA256.hexdigest(ENV.fetch('SIDEKIQ_PASSWORD', nil)))
  end
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => '/sidekiq'
  post '/auth/login', to: 'authentications#authenticate_user'
  constraints SubdomainConstraint do
    namespace :api, path: '/', constraints: { subdomain: 'api' }, format: :json do
      scope module: :v1, constraints: ApiConstraint.new(version: 1, default: false) do
        resources :users
      end
    end
  end
end
