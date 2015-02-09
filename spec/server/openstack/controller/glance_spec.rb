require 'spec_helper'

describe file('/etc/glance') do
  it { should be_directory }
end

['/etc/glance/glance-api-paste.ini', '/etc/glance/glance-cache.conf', '/etc/glance/glance-api.conf', '/etc/glance/glance-registry.conf'].each do |filename|
  describe file(filename) do
    it { should be_file }
  end
end

['glance', 'python-glanceclient'].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe file('/var/lib/glance/glance.sqlite') do
  it { should_not be_file }
end

['glance-api', 'glance-registry'].each do |svcname|
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
