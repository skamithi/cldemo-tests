require 'spec_helper'

for pkg in ["memcached","libapache2-mod-wsgi","openstack-dashboard"] do
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service("apache2") do
  it { should be_running }
end

describe service("memcached") do
  it { should be_running }
end

describe file("/etc/openstack-dashboard/local_settings.py") do
  it { should be_file }
end

describe package("openstack-dashboard-ubuntu-theme") do
  it { should_not be_installed }
end
