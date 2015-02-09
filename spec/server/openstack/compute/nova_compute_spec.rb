require 'spec_helper'

describe file('/etc/nova/nova.conf') do
  it { should be_file }
end

['nova-compute', 'nova-api-metadata'].each do |svcname|
  describe service(svcname) do
    it { should be_enabled }
    it { should be_running }
  end
end

describe port(8775) do
  it { should be_listening.with('tcp') }
end
