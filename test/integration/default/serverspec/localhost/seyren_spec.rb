require 'spec_helper'

# http://serverspec.org/resource_types.html
describe package('mongodb') do
  it { should be_installed }
end

describe service('tomcat6') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(8080) do
  it { should be_listening }
end
