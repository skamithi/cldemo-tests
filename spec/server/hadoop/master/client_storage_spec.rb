require 'spec_helper'

['/user/', '/user/client'].each do |dirname|
  describe command('hdfs dfs -test -e ' + dirname) do
    its(:exit_status) { should eq 0 }
  end
end
