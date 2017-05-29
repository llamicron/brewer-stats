require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
  require 'pry'
  require_relative 'lib/brewer/stats'

  def reload!
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/brewer\// }
    files.each { |file| load file }
  end

  @logger = Brewer::Stats::Logger.new
  @form = Brewer::Stats::Formatter.new

  ARGV.clear
  Pry.start
end
