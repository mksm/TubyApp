source 'https://rubygems.org'

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

# Configuration
gem 'figaro', '~> 1.1', '>= 1.1.1'

# UI
gem 'rails-assets-bootstrap', '~> 3.3.6', source: 'https://rails-assets.org'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3'
end

group :test do
  gem 'rspec-rails', '~> 3.5', '>= 3.5.1'
  gem 'factory_girl_rails', '~> 4.7'
  gem 'capybara', '~> 2.7', '>= 2.7.1'
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
  gem 'pg'
end
