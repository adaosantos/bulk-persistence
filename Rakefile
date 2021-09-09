# frozen_string_literal: true

require 'bundler/gem_tasks'

require 'rake/testtask'
require 'rdoc/task'
require 'rubocop/rake_task'

namespace :test do
  versions = Dir['gemfiles/*.gemfile'].map do |gemfile_path|
    gemfile_path.split(%r{/|\.})[1]
  end

  versions.each do |version|
    desc "Test acts_as_paranoid against #{version}"
    task version: :environment do
      raise "Do not run the test:#{version} task with bundle exec!" if ENV['RUBYOPT'].include? %r{bundler/setup}

      sh "BUNDLE_GEMFILE='gemfiles/#{version}.gemfile' bundle install --quiet"
      sh "BUNDLE_GEMFILE='gemfiles/#{version}.gemfile' bundle exec rake -t test"
    end
  end

  desc 'Run all tests for acts_as_paranoid'
  task all: versions
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/test_*.rb'
  t.verbose = true
end

RuboCop::RakeTask.new

desc 'Generate documentation for the acts_as_paranoid plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'BulkPersistence'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Install gem locally'
task install: :build do
  system "gem install pkg/#{spec.name}-#{spec.version}"
end

desc 'Clean automatically generated files'
task clean: :environment do
  FileUtils.rm_rf 'pkg'
end

desc 'Default: run unit tests'
task default: 'test:all'
