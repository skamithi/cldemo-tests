require 'serverspec'
require 'net/ssh'

set :backend, :ssh

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']

options = Net::SSH::Config.for(host)

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options

# Disable sudo
# set :disable_sudo, true

# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C' 

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'

class TestConfig
  attr_reader :target, :topology

  def initialize(target, topology)
    @target = target.downcase
    @topology = topology.downcase
  end
end

@tc = TestConfig.new(ENV['TARGET_HOST'] || 'unknown', ENV['TOPOLOGY'] || '1s')

def target
  @tc.target
end

def topology
  @tc.topology
end

def spine?
  @tc.target.start_with? 'spine'
end

def leaf?
  @tc.target.start_with? 'leaf'
end

def server?
  @tc.target.start_with? 'server'
end

puts "Target is #{target} and topology is #{topology}"
