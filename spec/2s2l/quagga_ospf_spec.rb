require 'spec_helper'

# my interfaces
describe command("cl-ospf interface show lo") do
  its(:stdout) { should match /ifindex 1, MTU / }
  its(:stdout) { should match /Internet Address 10.2.1.1\/32/ }
end

# interfaces are unnumbered and have a neighbor
for interface in ["swp1","swp2","swp3","swp4","swp17","swp18","swp19","swp20"] do
  describe command("cl-ospf interface show #{interface}") do
     its(:stdout) { should match /This interface is UNNUMBERED/ }
     its(:stdout) { should match /Adjacent neighbor count is 1/ }
  end
end

# neighbors
describe command("cl-ospf neighbor show") do
  for neighbor in ["10.2.1.3","10.2.1.4"] do
    its(:stdout) { should match /#{neighbor} / }
  end
end
