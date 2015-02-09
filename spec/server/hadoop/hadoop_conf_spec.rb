require 'spec_helper'

['capacity-scheduler.xml', 'commons-logging.properties', 'container-executor.cfg', 'core-site.xml', 'createDirs.sh', 'directories.sh', 'hadoop-env.sh', 'hadoop-metrics2.properties-GANGLIA', 'hadoop-metrics2.properties', 'hadoop-policy.xml', 'hdfs-site.xml', 'health_check', 'log4j.properties', 'mapred-queue-acls.xml', 'mapred-site.xml', 'usersAndGroups.sh', 'yarn-env.sh', 'yarn-site.xml'].each do |filename|
  filepath = '/etc/hadoop/conf/' + filename
  describe file(filepath) do
    it { should be_file }
  end
end
