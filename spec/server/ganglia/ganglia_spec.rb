require 'spec_helper'

for pkg in ["apache2","libapache2-mod-php5","rrdtool"]
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service('apache2') do
  it { should be_running }
end

describe port(80) do 
  it { shoould be_listening.with('tcp6') }
end

for nofile in ["/etc/apache2/sites-enabled/15-default.conf","/etc/apache2/sites-enabled/000-default"]
  describe file(nofile) do
    it { should_not be_file }
  end
end

for dir in ["/var/lib/ganglia-web/dwoo/compiled","/var/lib/ganglia-web/dwoo/cache"]
  describe file(dir) do
    it { should be_directory }
  end
end

