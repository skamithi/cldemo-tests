require 'spec_helper'

describe kernel_module("bonding") do
  it { should be_loaded }
end
