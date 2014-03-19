# -*- mode: ruby; coding: utf-8; -*-

source 'https://rubygems.org'

gem 'berkshelf', github: 'berkshelf/berkshelf'

group :test do
  gem 'chef', '11.10.4'
  gem 'thor', '0.18.1'
  gem 'foodcritic', '3.0.3'
  gem 'rubocop', '0.18.1'
end

group :vagrant do
  #gem 'vagrant', github: 'mitchellh/vagrant', tag: 'v1.4.3'
  gem 'vagrant-berkshelf', github: 'berkshelf/vagrant-berkshelf'
  gem 'vagrant-omnibus', github: 'schisamo/vagrant-omnibus'
end

group :integration do
  gem 'test-kitchen', '1.2.1'
  gem 'kitchen-vagrant', '0.14.0'
end
