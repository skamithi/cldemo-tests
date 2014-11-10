require 'json'
require 'colorize'
require 'rake'
require 'rspec/core/rake_task'

# Load the test configuration data
config = JSON.parse(File.read('tests.json'))
puts config.to_s.colorize(:magenta) if ENV['DEBUG']

# Set the sudo password from the config unless the user has over-riddent it
ENV['SUDO_PASSWORD'] = config['sudo_password'] unless ENV.has_key?('SUDO_PASSWORD')

# Gather the Rake tasks to define from the config
tasks = config['tasks']

# Define a top-level Rake task for each task defined, and set the correct
# environment variables and test set to be run
tasks.each do |t|
  desc "Run serverspec tests #{t['name']}"
  task t['name'].to_sym do
    ENV['TOPOLOGY'] = t['topology']

    # Each set of tests is run once per. host, so keep track of how many hosts
    # failed
    failures = 0

    t['targets'].each do |target|
      begin
        ENV['TARGET_HOST'] = target
        Rake::Task['spec:run'].execute(name: t['name'], target: target, set: t['set'])
      rescue Exception => e
        puts "Serverspec tests for #{target} failed: #{e.class} #{e.message}".colorize(:red)
        failures += 1
      end
    end
    if failures > 0
      puts "#{failures} of #{t['targets'].length} hosts failed".colorize(:red)
    else
      puts "All tests passed succesfully".colorize(:green)
    end
  end
end

namespace :spec do
  task :run, [:name, :target, :set] do |_, args|
    puts "Running tests #{args[:name]} on #{args[:target]}".colorize(:blue)

    # Define and invoke a new RSpec task for all of the test sets this test
    # requires
    taskname = "#{args[:name]}#{args[:target]}"
    RSpec::Core::RakeTask.new("spec:#{taskname}".to_sym) do |t|
      t.pattern = FileList[args[:set].map{|el| "spec/#{el}/*_spec.rb"}]
    end
    Rake::Task["spec:#{taskname}"].execute
  end
end
