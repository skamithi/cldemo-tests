require 'spec_helper'

for username in ["cumulus","rocket","turtle"]
  describe user(username) do
    it { should exist }
    it { should belong_to_group "sudo" }
  end
end
