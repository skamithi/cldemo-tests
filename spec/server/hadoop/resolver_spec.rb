require 'spec_helper'

for hostname in ['server1-hadoop', 'server2-hadoop'] do
  describe host(hostname) do
    it { should be_resolvable }
  end
end

describe host('server1-hadoop') do
  its(:ipaddress) { should eq '10.4.1.2' }
end

describe host('server2-hadoop') do
  its(:ipaddress) { should eq '10.4.2.2' }
end
