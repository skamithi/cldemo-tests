require 'spec_helper'

['hadoop-namenode', 'yarn-resourcemanager', 'mapred-historyserver'].each do |servicename|
  describe service(servicename) do
    it { should be_running }
  end
end
