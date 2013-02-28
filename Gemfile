source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'jquery-rails', '2.1.3'
gem 'jquery-ui-rails'
gem 'mysql2'

gem 'sidekiq'
gem 'qe', :require => 'qe/sidekiq', :git => "git://github.com/fnando/qe"

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development, :test do
  gem "sqlite3"
  gem "rspec-rails", "2.11.0"
  gem "capybara"
end

group :development do
  gem "pry", :require => false
  gem "awesome_print", :require => false
end

group :production do
  gem "unicorn"
end
