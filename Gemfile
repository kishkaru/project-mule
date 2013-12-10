source 'http://rubygems.org'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book

group :development do
    gem 'railroady'
    gem 'better_errors'
    gem 'binding_of_caller'
end

group :development, :test do
    gem 'sqlite3'
    gem 'ruby-debug19'
    gem 'database_cleaner', '< 1.1.0'
    gem 'capybara'
    gem 'launchy'
    gem 'rspec-rails'
    gem 'simplecov', :require => false
    gem 'html2haml'
    gem 'rack_session_access'
    gem 'selenium-webdriver'
end

group :test do
    gem 'cucumber-rails'
    gem 'cucumber-rails-training-wheels'

end
group :production do
    gem 'pg'
    gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
    gem 'therubyracer', '~> 0.12.0'
    gem 'sass-rails', '~> 3.2.6'
    gem 'coffee-rails', '~> 3.2.2'
    gem 'uglifier'
end

gem 'jquery-rails'
gem 'haml'
gem 'devise'
gem 'cancan'
gem 'figaro'
gem 'braintree'
gem 'twilio-ruby'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

gem 'kaminari'
