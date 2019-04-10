# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'rails', '~> 5.2.1'
gem 'pg', '~> 0.21'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors', '~>  0.4.0'
gem 'active_model_serializers', '~> 0.10.9'
gem 'devise', '~> 4.6', '>= 4.6.1'
gem 'doorkeeper', '~> 5.0', '>= 5.0.2'
gem 'mqtt', '~> 0.5.0'
gem 'sidekiq', '~> 5.2', '>= 5.2.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
