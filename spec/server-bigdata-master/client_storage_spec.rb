require 'spec_helper'

for dirname in ["/user/","/user/client"] do
  describe command("hadoop fs -test -e " + dirname) do
    its(:exit_status) { should eq 0 }
  end
end
