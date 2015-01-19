require 'spec_helper'

describe package('ganglia-monitor') do
  it { should be_installed }
end

describe service('gmond') do
  it { should be_running }
end

describe file('/etc/ganglia/gmond.conf') do
  it { should be_file }
end

describe file('/usr/lib/ganglia/python_modules/multi_interface.py') do
  it { should be_file }
end

describe file('/etc/ganglia/conf.d/multi_interface.pyconf') do
  it { should be_file }
end
