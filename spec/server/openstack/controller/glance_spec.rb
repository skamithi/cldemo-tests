require 'spec_helper'

describe file('/etc/glance') do
  it { should be_directory }
end

for filename in ['/etc/glance/glance-api-paste.ini', '/etc/glance/glance-cache.conf', '/etc/glance/glance-api.conf', '/etc/glance/glance-registry.conf'] do
  describe file(filename) do
    it { should be_file }
  end
end

for pkg in ['glance', 'python-glanceclient'] do
  describe package(pkg) do
    it { should be_installed }
  end
end

describe file('/var/lib/glance/glance.sqlite') do
  it { should_not be_file }
end

for svcname in ['glance-api', 'glance-registry'] do
  describe service(svcname) do
    it { should be_running }
  end
end

describe port(9191) do
  it { should be_listening.with('tcp') }
end

describe port(9292) do
  it { should be_listening.with('tcp') }
end
