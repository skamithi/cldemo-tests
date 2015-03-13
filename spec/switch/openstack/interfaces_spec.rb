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

# Test bonds exist
target_data['bonds'].each do |bnd|
  describe bond(bnd) do
    it { should exist }
  end

  bnd['interfaces'].each do |intf|
    describe bond(bnd['name']) do
      it { should have_interface(intf) }
    end
  end
end

# Test bridges exist
target_data['bridges'].each do |brdge|
  describe bridge(brdge['name']) do
    it { should exist }
  end

  brdg['interfaces'].each do |intf|
    describe bridge(brdg['name']) do
      it { should have_interface(intf) }
    end
  end
end
