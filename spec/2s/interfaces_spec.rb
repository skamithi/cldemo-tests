require 'spec_helper'

# ospf unnumbered has same IP on a bunch of devices
for intname in ["lo","swp1","swp2","swp3","swp4"]
  describe interface(intname) do
    it { should have_ipv4_address("10.2.1.1/32") }
  end
end

describe interface('br0') do
  it { should have_ipv4_address("10.4.1.1/25") }
end

describe interface('br1') do
  it { should have_ipv4_address("10.4.1.129/25") }
end
