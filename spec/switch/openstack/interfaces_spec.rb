require 'spec_helper'
require 'json'

node_data = JSON.parse(File.read(File.expand_path('../data/interfaces.json', __FILE__)))

# Select the data that's specific to this node
target_data = node_data['config'][target]

# ospf unnumbered has same IP on a bunch of devices
target_data['interfaces'].each do |intf|
  describe interface(intf) do
    it { should exist }
  end
end
