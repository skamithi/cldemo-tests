require 'spec_helper'

node_data = JSON.parse(File.read(File.expand_path('../data/nodes.json',__FILE__)))

for hostname in node_data['members'][topology]
  describe host(hostname) do
    it { should be_resolvable }
  end
end
