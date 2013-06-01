#!/usr/bin/env rake

desc 'Clean up temporary files / directories'
task :cleanup do
  ['log', 'tmp'].each do |dir|
    `rm -rf #{dir}/*`
  end
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w(--format progress)
end

task :test => :spec

task :default => :test
