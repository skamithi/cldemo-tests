require 'rake'
require 'rspec/core/rake_task'

tasks = [{name: 'core2s', topology: '2s', set: ['core'], targets: ['leaf1', 'leaf2']},
         {name: 'ospfunnum2s', topology: '2s', set: ['core', '2s', 'ospfunnum'], targets: ['leaf1', 'leaf2']}
        ]

# Define a top-level Rake task for each task defined, and set the correct
# environment variables and test set to be run
tasks.each do |t|
  desc "Run serverspec tests #{t[:name]}"
  task t[:name].to_sym do
    ENV['TOPOLOGY'] = t[:topology]

    # Each set of tests is run once per. host, so keep track of how many hosts
    # failed
    failures = 0

    t[:targets].each do |target|
      puts "Running tests for target #{target}"
      begin
        ENV['TARGET_HOST'] = target
        Rake::Task['spec:run'].execute(name: t[:name], target: target, set: t[:set])
      rescue Exception => e
        puts "Serverspec tests for #{target} failed: #{e.class} #{e.message}"
        failures += 1
      end
    end
    puts "#{failures} of #{t[:targets].length} hosts failed"
  end
end

namespace :spec do
  task :run, [:name, :target, :set] do |_, args|
    puts "Running tests #{args[:name]} on #{args[:target]}"

    # Define and invoke a new RSpec task for all of the test sets this test
    # requires
    taskname = "#{args[:name]}#{args[:target]}"
    RSpec::Core::RakeTask.new("spec:#{taskname}".to_sym) do |t|
      t.pattern = FileList[args[:set].map{|el| "spec/#{el}/*_spec.rb"}]
    end
    Rake::Task["spec:#{taskname}"].execute
  end
end
