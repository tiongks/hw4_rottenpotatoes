source 'http://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development do
  gem 'sqlite3'
  # gem 'ruby-debug19', :require => 'ruby-debug'
	gem 'debugger'
end

group :test do
  gem 'sqlite3'
  # gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'debugger'
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'rspec-mocks'
  gem 'simplecov'
  gem 'autotest'
  # gem 'factory_girl_rails'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # gem 'therubyracer'              
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'
