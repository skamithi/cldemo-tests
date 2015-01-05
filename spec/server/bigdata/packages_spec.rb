require 'spec_helper'

for pkg in ["hadoop","hadoop-client","hadoop-hdfs","hadoop-mapreduce","hadoop-yarn","libhdfs0","libhdfs0-dev","ntp","openssl","openjdk-7-jre"] do
  describe package(pkg) do
    it { should be_installed }
  end
end

