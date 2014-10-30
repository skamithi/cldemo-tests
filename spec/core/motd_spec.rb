require 'spec_helper'

describe file('/etc/motd') do
  it { should be_file }
  it { should contain ENV['TARGET_HOST'] }
end
