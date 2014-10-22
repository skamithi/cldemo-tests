require 'spec_helper'

describe file('/cumulus') do
  it { should be_directory }
end
