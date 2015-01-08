require 'spec_helper'

for pkgname in ["nova-api","nova-cert","nova-conductor","nova-consoleauth","nova-novncproxy","nova-scheduler","python-novaclient","nova-compute-kvm","nova-network"] do
  describe package(pkgname) do
    it { should be_installed }
  end
end

for svcname in ["nova-api","nova-cert","nova-consoleauth","nova-scheduler","nova-conductor","nova-novncproxy","nova-compute","nova-network"] do
  describe service(svcname) do
    it { should be_running }
    it { should be_enabled }
  end
end

describe file("/var/lib/nova/nova.sqlite") do
  it { should_not be_file }
end

describe file("/etc/nova/nova.conf") do
  it { should be_file }
end

describe port(8775) do
  it { should be_listening.with('tcp') }
end
