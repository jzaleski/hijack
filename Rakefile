#!/usr/bin/env rake

desc 'Clean up temporary files/directories'
task :cleanup do
  ['log', 'tmp'].each do |dir|
    `rm -rf #{dir}/*`
  end
end

begin
  require 'rspec/core/rake_task'
rescue LoadError
  # Swallow
end

if defined?(RSpec::Core::RakeTask)
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = %w(--format progress)
  end

  desc 'Run `rspec`'
  task :test => :spec

  desc 'Run the default `Task`'
  task :default => :test
end

if ENV['HEROKU'].nil?
  # Load the "environment
  require File.expand_path('config/environment.rb', File.dirname(__FILE__))

  # Store the path to the "rake-tasks" directory as a constant
  RAKE_TASKS_DIR = "#{ROOT_DIR}/lib/tasks"

  # Store the path to the "spec" directory as a constant
  SPEC_DIR = "#{ROOT_DIR}/spec"

  # Store the path to the "templates" directory as a constant
  TEMPLATES_DIR = "#{ROOT_DIR}/lib/templates"

  # Load any/all additional rake-task file(s)
  Dir["#{RAKE_TASKS_DIR}/*.rake"].each { |rake_task_file| load rake_task_file }
end
