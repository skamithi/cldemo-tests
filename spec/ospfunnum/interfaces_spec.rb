require 'spec_helper'
require 'json'

node_data = JSON.parse(File.read(File.expand_path('../data/interfaces.json', __FILE__)))

# Select the data that's specific to this node
target_data = node_data[target]
lldp_count = target_data['lldp_count']

# ospf unnumbered has same IP on a bunch of devices
target_data['interfaces'][topology].each do |intname|
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

describe 'LLDP neighbors' do
  describe command('lldpctl -f keyvalue | grep -o port.ifname | wc -l') do
    its(:stdout) { should eq "#{lldp_count}\n" }
  end
end
