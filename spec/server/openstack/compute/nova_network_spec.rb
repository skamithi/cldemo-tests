require 'spec_helper'

describe file('/etc/nova/nova.conf') do
  it { should be_file }
end

['nova-network'].each do |svcname|
  describe service(svcname) do
    it { should be_enabled }
    it { should be_running }
  end
end
