require 'spec_helper'

describe package('keystone') do
  it { should be_installed }
end

describe service('keystone') do
  it { should be_running }
end

describe file('/var/lib/keystone/keystone.db') do
  it { should_not be_file }
end

describe port(5000) do
  it { should be_listening.with('tcp') }
end

describe port(35_357) do
  it { should be_listening.with('tcp') }
end
