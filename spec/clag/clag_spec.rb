require 'spec_helper'

describe file('/etc/default/clagd') do
    it { should be_file }
end

describe command('clagctl') do
    its(:stdout) { should match /The peer is alive/ }
end
