source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# Auth
gem 'devise', '~> 4.2'
gem 'cancancan', '~> 1.15'
gem 'simple_form', '~> 3.2', '>= 3.2.1'

# Api Auth
gem 'api-auth', '~> 2.0', '>= 2.0.1'

# Configuration
gem 'figaro', '~> 1.1', '>= 1.1.1'

# UI
gem 'rails-assets-bootstrap', '~> 3.3.6', source: 'https://rails-assets.org'
# timeout long request handling
gem "rack-timeout"

#autoscale
gem 'rails_autoscale_agent'

# Paging
gem 'kaminari', '~> 0.17.0'

# Translations
gem 'http_accept_language', '~> 2.0', '>= 2.0.5'
gem 'globalize', github: 'globalize/globalize', ref: "38443bcd07da78b7b8a9433e4c6c32dd51f964a3"
gem 'globalize-accessors'
gem 'activemodel-serializers-xml'

# Background jobs
gem 'delayed_job_active_record', '~> 4.1', '>= 4.1.1'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3'
end

# Youtube library
gem 'yt', '~> 0.28.0'

group :test do
  gem 'rspec-rails', '~> 3.5', '>= 3.5.1'
  gem 'webmock', '~> 2.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.1'
  gem 'factory_girl_rails', '~> 4.7'
  gem 'capybara', '~> 2.7', '>= 2.7.1'
  gem 'database_cleaner', '~> 1.5.1'
  gem 'json_spec', '~> 1.1', '>= 1.1.4'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'launchy'
  gem 'simplecov', '~> 0.12.0', require: false
  gem 'faker'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production, :staging do
  gem 'rails_12factor'
  gem 'pg', '0.19.0'
end
