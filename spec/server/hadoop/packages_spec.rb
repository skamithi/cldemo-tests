require 'spec_helper'

['hadoop', 'hadoop-client', 'hadoop-hdfs', 'hadoop-mapreduce', 'hadoop-yarn', 'libhdfs0', 'libhdfs0-dev', 'ntp', 'openssl', 'openjdk-7-jre'].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
