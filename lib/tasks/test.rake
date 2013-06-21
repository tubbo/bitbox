begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)
rescue LoadError => error
  puts "Warning: #{error.message}"
end

desc "Run all RSpec and Teabag tests"
task :test => ['db:test:prepare', 'spec', 'teaspoon']
