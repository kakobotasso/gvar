source :rubygems

gem 'rails', '3.2.11'
gem 'jquery-rails'
gem 'mysql2'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

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
