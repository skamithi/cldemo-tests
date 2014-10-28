require 'rake'
require 'rspec/core/rake_task'

task :core2s do
  Rake::Task['spec:run'].execute({targets: ['leaf1', 'leaf2'],
                                      set: ['core']})
end

task :ospfunnum2s => :core2s do
  ENV['TOPOLOGY'] = '2s'
  Rake::Task['spec:run'].execute({targets: ['leaf1', 'leaf2'],
                                      set: ['2s', 'ospfunnum']})
end

task :core2s2l do
  Rake::Task['spec:run'].execute({targets: ['leaf1', 'leaf2', 'spine1', 'spine2'],
                                      set: ['core']})
end

task :ospfunnum2s2l => :core2s2l do
  ENV['TOPOLOGY'] = '2s2l'
  Rake::Task['spec:run'].execute({targets: ['leaf1', 'leaf2', 'spine1', 'spine2'],
                                      set: ['2s2l', 'ospfunnum']})
end

namespace :spec do
  tests = []
  Dir.glob('./spec/*').each do |dir|
    next unless File.directory?(dir)
    tests << File.basename(dir)
  end

  # Define Rake tasks to run RSpec for each set of tests
  tests.each do |test|
    desc "Run serverspec tests #{test}"
    RSpec::Core::RakeTask.new(test.to_sym) do |t|
      t.pattern = "spec/#{test}/*_spec.rb"
    end
  end

  task :run, [:targets, :set] do |_, args|
    targets = args[:targets]
    set = args[:set]
    targets.each do |target|
      puts "Running tests for target #{target}"
      begin
        set.each do |test|
          ENV['TARGET_HOST'] = target
          Rake::Task["spec:#{test}"].execute
        end
      rescue Exception => e
        puts "Serverspec tests for #{target} failed: #{e.class} #{e.message}"
      end
    end
  end
end
