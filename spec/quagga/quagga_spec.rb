require 'spec_helper'

describe service("zebra") do
  it { should be_running }
end

describe service("bgpd") do
  it { should be_running }
end

describe service("ospfd") do
  it { should be_running }
end

describe service("watchquagga") do
  it { should be_running }
end

["Quagga.conf","bgpd.conf","daemons","debian.conf","ospf6d.conf","ospfd.conf","vtysh.conf","zebra.conf"].each do |cfgfile|
  describe file("/etc/quagga/#{cfgfile}") do
    it { should be_file }
  end
end
