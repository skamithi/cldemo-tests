require 'spec_helper'

describe user('cumulus') do
  it { should exist }
  it { should belong_to_group 'sudo' }
end
