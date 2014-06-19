# -*- mode: ruby; coding: utf-8; -*-

source 'https://api.berkshelf.com'

metadata

cookbook 'java', git: 'https://github.com/socrata-cookbooks/java'
cookbook 'ark', '0.7.0'
cookbook 'tomcat', '0.15.12'
cookbook 'application_java', git: 'https://github.com/jamiely/application_java'
cookbook 'mongodb', git: 'https://github.com/edelight/chef-mongodb'

group :integration do
  cookbook 'apt', '~> 2.0'
end
