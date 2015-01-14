require 'spec_helper'

for servicename in ["hadoop-namenode","yarn-resourcemanager", "mapred-historyserver"] do
  describe service(servicename) do
    it { should be_running }
  end
end

