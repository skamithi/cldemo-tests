require 'spec_helper'

describe package('snmpd') do
  it { should be_installed }
end

describe package('snmp') do
  it { should be_installed }
end

describe service('snmpd') do
  it { should be_running }
  it { should be_enabled }
end

describe file("/etc/snmp/snmpd.conf") do
  it { should be_file }
end
