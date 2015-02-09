require 'spec_helper'

for pkg in ['nova-compute-kvm', 'vlan', 'nova-network', 'vim', 'ifenslave'] do
  describe package(pkg) do
    it { should be_installed }
  end
end
