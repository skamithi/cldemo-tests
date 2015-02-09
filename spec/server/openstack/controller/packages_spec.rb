require 'spec_helper'

['nova-compute-kvm', 'vlan', 'nova-network', 'vim', 'ifenslave'].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
