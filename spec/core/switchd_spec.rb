require 'spec_helper'

describe service('switchd') do
  #  it { should be_enabled }
  it { should be_running }
end

# fuse
describe file('/cumulus/switchd/version') do
  it { should be_file }
end

describe file('/cumulus/switchd/run') do
  it { should be_directory }
end

# config
describe file('/etc/cumulus/ports.conf') do
  it { should be_file }
end

describe file('/etc/cumulus/switchd.conf') do
  it { should be_file }
end

# state
describe file('/var/lib/cumulus') do
  it { should be_directory }
end

describe file('/var/lib/cumulus/phytab') do
  it { should be_file }
end

describe file('/var/lib/cumulus/porttab') do
  it { should be_file }
end
