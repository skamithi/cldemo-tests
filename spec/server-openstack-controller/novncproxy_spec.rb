require 'spec_helper'

describe package("nova-novncproxy") do
  it { should be_installed }
end

describe port(6080) do
  it { should be_listening.with('tcp') }
end
