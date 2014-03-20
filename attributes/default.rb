# -*- mode: ruby; coding: utf-8; -*-
#
# Cookbook Name:: seyren
#
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

default[:seyren][:application_name] = 'seyren'
default[:seyren][:application_path] = '/opt/seyren'
default[:seyren][:application_version] = '1.0.0-20140108-1700-43099ba756'
default[:seyren][:war_uri] = 'http://dl.bintray.com/obazoud/generic/seyren-web-1.0.0-20140108-1700-43099ba756.war'
