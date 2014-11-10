require 'rake'
require 'rspec/core/rake_task'

tasks = [{name: 'core2s', topology: '2s', set: ['core'], targets: ['leaf1', 'leaf2']},
         {name: 'ospfunnum2s', topology: '2s', set: ['core', '2s', 'ospfunnum'], targets: ['leaf1', 'leaf2']}
        ]

tasks.each do |t|
  desc "Run serverspec tests #{t[:name]}"
  task t[:name].to_sym do
    ENV['TOPOLOGY'] = t[:topology]

    t[:targets].each do |target|
      puts "Running tests for target #{target}"
      begin
        ENV['TARGET_HOST'] = target
        Rake::Task[:run].execute(name: t[:name], set: t[:set])
      rescue Exception => e
        puts "Serverspec tests for #{target} failed: #{e.class} #{e.message}"
      end
    end
  end
end

task :run, [:name, :set] do |_, args|
  puts "Running tests #{args[:name]}"

  RSpec::Core::RakeTask.new("#{args[:name]}spec".to_sym) do |t|
    t.pattern = FileList[args[:set].map{|el| "spec/#{el}/*_spec.rb"}]
  end
  Rake::Task["#{args[:name]}spec"].execute
end
