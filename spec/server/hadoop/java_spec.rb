require 'spec_helper'

describe package("java-common") do
  it { should be_installed }
end

describe file("/usr/java") do
  it { should be_directory }
end

describe file("/usr/java/default") do
  it { should be_symlink }
end

describe file("/usr/java/default") do
  it { should be_linked_to "/usr/lib/jvm/java-7-openjdk-amd64/jre" }
end
