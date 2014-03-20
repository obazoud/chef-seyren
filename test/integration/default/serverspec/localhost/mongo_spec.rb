# -*- mode: ruby; coding: utf-8; -*-

require 'spec_helper'

describe package('mongo-10gen') do
  it { should be_installed }
end

describe user('mongod') do
  it {
    should exist
    should have_login_shell '/bin/false'
  }
end

describe file('/etc/init.d/mongod') do
  it {
    should be_file
    should be_owned_by 'root'
    should be_grouped_into 'root'
    should be_mode 755
  }
end

describe service('mongod') do
  it {
    should be_running
    should be_enabled
  }
end

describe command('/bin/ps aux | grep mongo') do
  it {
    should return_exit_status 0
  }
end
