# -*- mode: ruby; coding: utf-8; -*-

source 'https://rubygems.org'

ruby '1.9.3'

gem 'berkshelf', '3.1.3'

group :test do
  gem 'chef', '11.10.4'
  gem 'chefspec', '3.4.0'
  gem 'thor', '0.19.1'
  gem 'foodcritic', '3.0.3'
  gem 'rubocop', '0.23.0'
end

group :integration do
  gem 'test-kitchen', '1.2.1'
  gem 'kitchen-vagrant', '0.15.0'
  gem 'kitchen-sync', '1.0.1'
  gem 'serverspec', '1.8.0'
end
