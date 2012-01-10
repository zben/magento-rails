source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'devise','1.5.2'
gem "omniauth-facebook"
gem "erb2haml", :group => :development
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
gem 'sqlite3',:group => :development
gem 'kaminari'
gem 'haml'
gem 'cells'
gem 'mongoid'
gem 'bson_ext'
gem 'savon'
gem 'rest-client'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  # gems specifically for Heroku go here
  gem "heroku"
  gem "pg"
end


gem "nifty-generators", :group => :development
gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end
gem "mocha", :group => :test
