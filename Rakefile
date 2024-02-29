require "bundler/gem_tasks"

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)
  task default: :spec

  task :integration_test do |t|
    sh "env $(cat LOCAL.env) rspec -P __tests__/Integration/* --color --format doc"
  end
rescue LoadError
  # no rspec available
end
