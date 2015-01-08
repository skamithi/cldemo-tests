require 'spec_helper'

describe package("rabbitmq-server") do
  it { should be_installed }
end

describe service("rabbitmq") do
  it { should be_running }
end

describe port(25672) do
  it { should be_listening.with('tcp') }
end
