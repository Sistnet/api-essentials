source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5.4'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 5.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Multitenancy for Rails
gem 'apartment'

# logging
gem 'lograge'
gem 'colorize'

# JWT authenticate
# gem 'knock' *Deprecated*
gem 'jwt'

# Http client
gem 'rest-client'

# Authorization
gem 'cancancan'

# Decorators
gem 'draper'

# PORO, ServiceObjects, FormObjects Helper
gem 'simple_command'

# handling background jobs
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'sidekiq-status'

# Views
gem 'jbuilder', '~> 2.11', '>= 2.11.5'

# BR Utils
gem 'cnpj_utils', '~> 1.2'
gem 'cpf_cnpj', '~> 0.5'
gem 'documentos_br', '~> 1.1'

# csv
gem 'smarter_csv'
gem 'csv-importer', '~> 0.8'
gem 'rubyXL', '~> 3.4', '>= 3.3.29'


# Documentation
gem 'rswag'

# Upload de arquivos
gem 'carrierwave', '~> 2.2.2'
gem 'carrierwave-i18n'
gem 'fog-aws', '~> 3.15.0'

# Pagination
gem 'active_model_serializers', '~> 0.10'
gem 'kaminari', '~> 1.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'annotate'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem 'spring'
  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'prettier'
  gem 'spring'
  gem 'ruby-lsp', '~> 0.3.4'
end

group :test do
  gem 'rspec-sidekiq'
  end

