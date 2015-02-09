require 'spec_helper'

['/mr-history', '/mr-history/tmp', '/mr-history/done', '/app-logs'].each do |dirname|
  describe command('hdfs dfs -test -e ' + dirname) do
    its(:exit_status) { should eq 0 }
  end
end
