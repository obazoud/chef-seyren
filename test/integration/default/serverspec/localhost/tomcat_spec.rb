# -*- mode: ruby; coding: utf-8; -*-

require 'spec_helper'

describe package('tomcat6') do
  it { should be_installed }
end

describe user('tomcat') do
  it {
    should exist
    should have_login_shell '/sbin/nologin'
  }
end

describe file('/etc/init.d/tomcat6') do
  it {
    should be_file
    should be_owned_by 'root'
    should be_grouped_into 'root'
    should be_mode 755
  }
end

describe service('tomcat6') do
  it { should be_enabled   }
  it { should be_running   }
end

describe command('/bin/ps aux | grep tomcat') do
  it {
    should return_exit_status 0
  }
end

describe command('/bin/ps -p `sudo /bin/cat /var/run/tomcat6.pid`') do
  it {
    should return_exit_status 0
  }
end
