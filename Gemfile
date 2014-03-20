# -*- mode: ruby; coding: utf-8; -*-

source 'https://rubygems.org'

gem 'berkshelf', github: 'berkshelf/berkshelf'

group :test do
  gem 'chef', '11.10.4'
  gem 'thor', '0.18.1'
  gem 'foodcritic', '3.0.3'
  gem 'rubocop', '0.18.1'
end

group :integration do
  gem 'net-ssh', '< 2.8.0'
  gem 'test-kitchen', '1.2.1'
  gem 'kitchen-vagrant', '0.14.0'
  gem 'vagrant', git: 'https://github.com/mitchellh/vagrant.git', tag: 'v1.4.3'
end
