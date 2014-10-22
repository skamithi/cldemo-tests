require 'rake'
require 'rspec/core/rake_task'

task :spec    => 'spec:all'
task :default => :spec

namespace :spec do
  targets = []
  Dir.glob('./spec/*').each do |dir|
    next unless File.directory?(dir)
    targets << File.basename(dir)
  end

  targets.each do |target|
    desc "Run serverspec tests to #{target}"
    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      ENV['TARGET_HOST'] = target
      t.pattern = "spec/#{target}/*_spec.rb"
    end
  end

  task :default => :all
  task :all do
    targets.each do |target|
      begin
        RSpec::Core::RakeTask.new(target.to_sym) do |t|
          ENV['TARGET_HOST'] = target
          t.pattern = "spec/#{target}/*_spec.rb"
        end

        Rake::Task[target].invoke
      rescue Exception => e
        puts "Serverspec tests for #{target} failed: #{e.class} #{e.message}"
      end
    end
  end
end
