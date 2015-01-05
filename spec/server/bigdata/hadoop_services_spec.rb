require 'spec_helper'

for servicename in ["mapred-historyserver","yarn-nodemanager","yarn-resourcemanager"] do
  describe service(servicename) do
    it { should be_running }
  end
end

