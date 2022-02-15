# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'rails', '~> 5.2.1'
gem 'pg', '~> 0.21'
gem 'puma', '~> 4.3'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors', '~> 1.0.5'
gem 'mqtt', '~> 0.5.0'

# Views
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'premailer-rails', '~> 1.10', '>= 1.10.2'
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'

# Models
gem 'active_model_serializers', '~> 0.10.9'
gem 'ransack', '~> 2.1', '>= 2.1.1'
gem 'annotate', '~> 2.7', '>= 2.7.4'

# Authorization and Authentication
gem 'devise', '~> 4.7'
gem 'doorkeeper', '~> 5.0'
gem 'pundit', '~> 2.0', '>= 2.0.1'
gem 'bcrypt', '~> 3.1', '>= 3.1.12'

# Background Jobs
gem 'sidekiq', '~> 5.2', '>= 5.2.5'
gem 'mini_scheduler', '~> 0.9.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'letter_opener', '~> 1.7'
  gem 'rails-erd', '~> 1.5', '>= 1.5.2'
  gem 'awesome_print', '~> 1.8'
  gem 'better_errors', '~> 2.8'
  gem "binding_of_caller"
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
