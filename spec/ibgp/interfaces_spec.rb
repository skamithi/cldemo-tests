require 'spec_helper'
require 'json'

node_data = JSON.parse(File.read(File.expand_path('../data/interfaces.json',__FILE__)))

# Select the data that's specific to this node
target_data = node_data['config'][target]

# ospf unnumbered has same IP on a bunch of devices
target_data['interfaces'][topology].each do |intf|
  describe interface(intf['name']) do
    it { should have_ipv4_address("#{intf['address']}/30") }
  end
end

describe interface('lo') do
  it { should have_ipv4_address("#{target_data['local_addr']}/32") }
end

if leaf?
  describe interface('br0') do
    it { should have_ipv4_address("#{target_data['br0_addr']}/25") }
  end

  describe interface('br1') do
    it { should have_ipv4_address("#{target_data['br1_addr']}/25") }
  end
end
