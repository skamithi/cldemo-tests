require 'spec_helper'

for servicename in ["hadoop-datanode","yarn-nodemanager"] do
  describe service(servicename) do
    it { should be_running }
  end
end

