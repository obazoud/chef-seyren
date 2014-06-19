# -*- mode: ruby; coding: utf-8; -*-

# Cookbook Name:: seyren
# Recipe:: mongo-import-data
# Author:: Olivier Bazoud (<olivier.bazoud@gmail.com>)
# Copyright 2014, Olivier Bazoud
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

search_query = node[:seyren][:search]

db            = node[:seyren][:mongo][:db]
col           = node[:seyren][:mongo][:collection]
file          = node[:seyren][:mongo][:file]

gem_package 'bson' do
  version '2.2.1'
  action :install
end

execute 'run-mongoimport-seyren' do
  command "mongo #{db} --eval \"db.#{col}.remove()\" \
          && mongoimport --db #{db} --collection #{col} --file #{file} --type json --upsert --upsertFields name"
  action :nothing
end

if Chef::Config[:solo] && !node.run_list?('recipe[chef-solo-search]')
  Chef::Log.fatal!('This recipe uses search. Chef Solo does not support search unless you install the chef-solo-search cookbook.')
end

if Chef::Config[:solo]
  hosts = [node]
else
  hosts = search(:node, search_query)
end

Chef::Log.debug("Found #{hosts}")

template file do
  source 'mongo-import-data.json.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables(
    hosts: hosts
  )
  notifies :run, 'execute[run-mongoimport-seyren]', :immediately
end

ruby_block 'remove_recipe_seyren_mongo_import_data' do
  block { node.run_list.remove('recipe[seyren::mongo-import-data]') }
end
