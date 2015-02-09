require 'spec_helper'

pkg = ['apache2', 'libapache2-mod-php5', 'rrdtool', 'gmetad']
pkg.each do |packages|
  describe package(packages) do
    it { should be_installed }
  end
end

describe service('apache2') do
  it { should be_running }
end

describe service('gmetad') do
  it { should be_running }
end

describe port(80) do
  it { should be_listening.with('tcp') }
end

nofile = ['/etc/apache2/sites-enabled/15-default.conf', '/etc/apache2/sites-enabled/000-default']
nofile.each do |notfile|
  describe file(notfile) do
    it { should_not be_file }
  end
end

dir = ['/var/lib/ganglia-web/dwoo/compiled', '/var/lib/ganglia-web/dwoo/cache']
dir.each do |directory|
  describe file(directory) do
    it { should be_directory }
  end
end

describe file('/etc/ganglia/gmetad.conf') do
  it { should be_file }
end
