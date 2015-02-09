require 'spec_helper'

pkg = ['apache2', 'libapache2-mod-php5', 'php5-cli', 'php5-gd', 'php5-common', 'php5-mcrypt', 'php5-mysql', 'php5-snmp', 'php-net-ipv4', 'php-net-ipv6', 'php-pear', 'fping', 'git', 'graphviz', 'imagemagick', 'ipmitool', 'mtr-tiny', 'nmap', 'python-mysqldb', 'rrdtool', 'snmp-mibs-downloader', 'whois']
pkg.each do |packages|
  describe package(packages) do
    it { should be_installed }
  end
end

describe service('apache2') do
  it { should be_running }
end

describe port(80) do
  it { should be_listening.with('tcp') }
end

describe file('/var/www/librenms/config.php') do
  it { should be_file }
end
# double check the run once happened
describe file('/tmp/puppet_once_lock') do
  it { should be_file }
end

describe file('/var/www/rrd') do
  it { should be_directory }
end

sym = ['/usr/local/sbin/librenms-syslog', '/etc/cron.d/librenms', '/etc/apache2/sites-enabled/librenms.conf']
sym.each do |symlink|
  describe file(symlink) do
    it { should be_symlink }
  end
end

describe user 'librenms' do
  it { should exist }
end
