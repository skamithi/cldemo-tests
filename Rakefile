require 'rake'
require 'rspec/core/rake_task'

task :core2s do
  targets = ['leaf1', 'leaf2']
  set = ['core']
  task('spec:run').invoke(targets, set)
end

task :ospfunnum2s do
  targets = ['leaf1', 'leaf2']
  # set = ['core', '2s', 'ospfunnum']
  set = ['core', 'ospfunnum']
  task('spec:run').invoke(targets, set)
end

task :ospfunnum2s2l do
  targets = ['leaf1', 'leaf2']
  set = ['core', '2s2l', 'ospfunnum']
  task('spec:run').invoke(targets, set)
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

  task :run, [:targets,:set] do |_, args|
    targets = args[:targets]
    set = args[:set]
    targets.each do |target|
      begin
        set.each do |test|
          ENV['TARGET_HOST'] = target
          Rake::Task["spec:#{test}"].invoke
        end
      rescue Exception => e
        puts "Serverspec tests for #{target} failed: #{e.class} #{e.message}"
      end
    end
  end
end
