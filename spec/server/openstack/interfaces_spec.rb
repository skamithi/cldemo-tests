require 'spec_helper'

describe interface('eth2') do
  it { should exist }
end

describe interface('eth3') do
  it { should exist }
end

describe interface('bond0') do
  it { should exist }
end

# check that bond0 is up
describe file('/sys/class/net/bond0/carrier') do
  its(:content) { should match '1' }
end
