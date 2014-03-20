require 'spec_helper'

describe port(8080) do
  it { should be_listening }
end

describe command('/usr/bin/curl -s -i http://localhost:8080/seyren/') do
  it {
    should return_exit_status 0
  }
  its(:stdout) {
    should match /HTTP\/1\.1 200/
  }
end
