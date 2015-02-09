require 'spec_helper'

for username in %w(zookeeper hdfs yarn mapred client) do
  describe user(username) do
    it { should exist }
  end
end
