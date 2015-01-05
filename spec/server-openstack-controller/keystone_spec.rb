require 'spec_helper'

describe package("keystone") do
  it { should be_installed }
end

describe port(5000) do
  it { should be_listening.with('tcp') }
end

describe port(35357) do
  it { should be_listening.with('tcp') }
end
