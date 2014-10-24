require 'spec_helper'


for intname in ["lo","swp1","swp2","swp3","swp4","swp17","swp18","swp19","swp20"]
  describe interface(intname) do
    it { should have_ipv4_address("10.2.1.1/32") }
  end
end

for hostname in ["leaf1","leaf2","spine1","spine2","wbench"]
  describe host(hostname) do
    it { should be_resolvable }
  end
end
