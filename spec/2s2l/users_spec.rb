require 'spec_helper'

for username in ["cumulus","rocket","turtle"]
  describe user(username) do
    it { should exist }
  end
end

describe user("cumulus") do
  it { should belong_to_group "sudo" }
end
