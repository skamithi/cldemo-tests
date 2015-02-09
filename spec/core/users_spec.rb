require 'spec_helper'

%w(cumulus rocket turtle).each do |username|
  describe user(username) do
    it { should exist }
    it { should belong_to_group 'sudo' }
  end
end
