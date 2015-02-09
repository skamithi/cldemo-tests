require 'spec_helper'

['hadoop-datanode', 'yarn-nodemanager'].each do |servicename|
  describe service(servicename) do
    it { should be_running }
  end
end
