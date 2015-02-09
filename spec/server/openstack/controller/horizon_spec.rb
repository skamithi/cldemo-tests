require 'spec_helper'

['apache2', 'memcached', 'libapache2-mod-wsgi', 'openstack-dashboard'].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service('apache2') do
  it { should be_running }
end

describe service('memcached') do
  it { should be_running }
end

describe file('/etc/openstack-dashboard/local_settings.py') do
  it { should be_file }
end

describe package('openstack-dashboard-ubuntu-theme') do
  it { should_not be_installed }
end

describe port(80) do
  it { should be_listening.with('tcp6') }
end
