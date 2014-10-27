require 'spec_helper'

case ENV['TARGET_HOST']
  when 'leaf1'
    describe interface('br0') do
      it { should have_ipv4_address('10.4.1.1/25') }
    end

    describe interface('br1') do
      it { should have_ipv4_address('10.4.1.129/25') }
    end

    ipv4addr = '10.2.1.1/32'
  when 'leaf2'
    describe interface('br0') do
      it { should have_ipv4_address('10.4.2.1/25') }
    end

    describe interface('br1') do
      it { should have_ipv4_address('10.4.2.129/25') }
    end

    ipv4addr = '10.2.1.2/32'
  when 'spine1'
    ipv4addr = '10.2.1.3/32'
  when 'spine2'
    ipv4addr = '10.2.1.4/32'
end

# ospf unnumbered has same IP on a bunch of devices
for intname in ['lo','swp1','swp2','swp3','swp4','swp17','swp18','swp19','swp20']
  describe interface(intname) do
    it { should have_ipv4_address(ipv4addr) }
  end
end


