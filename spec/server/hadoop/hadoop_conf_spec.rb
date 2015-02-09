require 'spec_helper'

for filename in ['capacity-scheduler.xml', 'commons-logging.properties', 'container-executor.cfg', 'core-site.xml', 'createDirs.sh', 'directories.sh', 'hadoop-env.sh', 'hadoop-metrics2.properties-GANGLIA', 'hadoop-metrics2.properties', 'hadoop-policy.xml', 'hdfs-site.xml', 'health_check', 'log4j.properties', 'mapred-queue-acls.xml', 'mapred-site.xml', 'usersAndGroups.sh', 'yarn-env.sh', 'yarn-site.xml'] do
  filepath = '/etc/hadoop/conf/' + filename
  describe file(filepath) do
    it { should be_file }
  end
end
