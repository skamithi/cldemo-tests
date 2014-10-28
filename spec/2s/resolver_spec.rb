require 'spec_helper'

for hostname in ["leaf1","leaf2","wbench"]
  describe host(hostname) do
    it { should be_resolvable }
  end
end
