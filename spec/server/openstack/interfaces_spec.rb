require 'spec_helper'

describe interface("eth2") do
  it { should exist }
end

describe interface("eth3") do
  it { should exist }
end

describe interface("bond0") do
  it { should exist }
end
