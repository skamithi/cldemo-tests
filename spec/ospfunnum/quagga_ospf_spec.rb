require 'spec_helper'
require 'json'

node_data = JSON.parse(File.read(File.expand_path('../data/quagga.json', __FILE__)))

# Select the data that's specific to this node
target_data = node_data[target]

describe command('cl-ospf interface show lo') do
  its(:stdout) { should match(/ifindex 1, MTU /) }
  its(:stdout) { should match(/Internet Address #{target_data['local_addr']}\/32/) }
end

# Select the data that's specific to this node for the given topology
interfaces = target_data[topology]['interfaces']
neighbors = target_data[topology]['neighbors']
ospf_routes = target_data[topology]['ospf_routes']
# interfaces are unnumbered and have a neighbor
interfaces.each do |interface|
  describe command("cl-ospf interface show #{interface}") do
    its(:stdout) { should match(/This interface is UNNUMBERED/) }
    its(:stdout) { should match(/Adjacent neighbor count is 1/) }
  end
end

# neighbors
describe command('cl-ospf neighbor show') do
  neighbors.each do |neighbor|
    its(:stdout) { should match(/#{neighbor} /) }
  end
end

describe 'Number of OSPF routes' do
  describe command("cl-ospf route show | egrep '^\\w' | wc -l") do
    its(:stdout) { should eq("#{ospf_routes}\n") }
  end
end
