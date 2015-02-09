require 'spec_helper'

%w(zookeeper hdfs yarn mapred client).each do |username|
  describe user(username) do
    it { should exist }
  end
end
