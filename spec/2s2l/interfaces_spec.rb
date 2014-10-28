require 'spec_helper'
require 'json'

node_data = JSON.parse(File.read(File.expand_path('../data/nodes.json',__FILE__)))

# Select the data that's specific to this node
target_data = node_data[target]

# ospf unnumbered has same IP on a bunch of devices
for intname in ['lo','swp1','swp2','swp3','swp4','swp17','swp18','swp19','swp20']
  describe interface(intname) do
    it { should have_ipv4_address("#{target_data['local_addr']}/32") }
  end
end

if leaf?
  describe interface('br0') do
    it { should have_ipv4_address("#{target_data['br0_addr']}/25") }
  end

  describe interface('br1') do
    it { should have_ipv4_address("#{target_data['br1_addr']}/25") }
  end
end
