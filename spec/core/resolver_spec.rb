require 'spec_helper'
require 'json'

node_data = JSON.parse(File.read(File.expand_path('../data/nodes.json',__FILE__)))

node_data['members'][topology].each do |hostname|
  describe host(hostname) do
    it { should be_resolvable }
  end
end
