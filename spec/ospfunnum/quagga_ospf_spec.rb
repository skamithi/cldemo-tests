require 'spec_helper'

# my interfaces
case ENV['TARGET_HOST']
  when 'leaf1'
    intfaddr = '10.2.1.1'
  when 'leaf2'
    intfaddr = '10.2.1.2'
  when 'spine1'
    intfaddr = '10.2.1.3'
  when 'spine2'
    intfaddr = '10.2.1.4'
end

describe command("cl-ospf interface show lo") do
  its(:stdout) { should match /ifindex 1, MTU / }
  its(:stdout) { should match /Internet Address #{intfaddr}\/32/ }
end

case ENV['TOPOLOGY']
  when '2S'
    interfaces = ["swp1","swp2","swp3","swp4"] 
    neighbors = ["10.2.1.2"]
  when '2S2L'
    interfaces = ["swp1","swp2","swp3","swp4","swp17","swp18","swp19","swp20"] 
    if ENV['TARGET_HOST'].start_with? 'spine'
      neighbors = ['10.2.1.1','10.2.1.2']
    else
      neighbors = ['10.2.1.3','10.2.1.4']
    end
end

# interfaces are unnumbered and have a neighbor
for interface in interfaces do
  describe command("cl-ospf interface show #{interface}") do
     its(:stdout) { should match /This interface is UNNUMBERED/ }
     its(:stdout) { should match /Adjacent neighbor count is 1/ }
  end
end

# neighbors
describe command("cl-ospf neighbor show") do
  for neighbor in neighbors do
    its(:stdout) { should match /#{neighbor} / }
  end
end
