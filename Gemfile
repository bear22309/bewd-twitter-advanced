source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 6.1.6.1'
gem 'puma', '>= 5.6.4'
gem 'sass-rails', '~> 6.0'
gem 'uglifier', '~> 4.2.0'
gem 'jquery-rails', '~> 4.4'
gem 'turbolinks', '~> 5.2.1'
gem 'jbuilder', '~> 2.11'
gem 'bcrypt', '~> 3.1'
gem 'aws-sdk-s3', '~> 1.126'
gem 'webrick', '~> 1.7'
gem 'mail', '>= 2.8.0.rc1'
gem 'bootsnap', '>= 1.13', require: false

group :development, :test do
  gem 'byebug', '~> 11.1.3', platforms: %i[mri mingw x64_mingw]
  gem 'awesome_print', '~> 1.9'
  gem 'dotenv-rails', '~> 2.8'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'pry-rails', '>= 0.3.9'
  gem 'rspec-rails', '~> 5.1'
  gem 'rubocop', '~> 1.36'
  gem 'rubocop-rspec', '2.12'
  gem 'sqlite3', '~> 1.5', '>= 1.5.1'
  gem 'rails-controller-testing', '~> 1.0' # Add this line
end

group :development do
  gem 'listen', '~> 3.7.1'
  gem 'web-console', '>= 4.2'
  gem 'spring', '< 3.0'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :production do
  gem 'pg', '~> 1.4.3'
end

gem 'nio4r', '~> 2.5.9'

