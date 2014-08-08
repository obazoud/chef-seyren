# encoding: utf-8

require 'bundler'
require 'bundler/setup'

require 'foodcritic'
require 'rubocop'

require 'English' # for $CHILD_STATUS

# Deal with system exit status
module SystemExec
  include Thor::Actions

  def check_system(*args)
    say "Executes command #{args}", :yellow
    system(*args)
    exit $CHILD_STATUS.exitstatus if $CHILD_STATUS != 0
  end
end

# style on ruby and cookbooks
class Style < Thor
  include SystemExec
  include Thor::Actions

  desc 'knife', 'Run knife cookbook tests'
  def knife
    say 'Run knife cookbook tests...', :green
    check_system 'knife', 'cookbook', 'test', '--all', '--config', '.chef/knife.rb'
  end

  desc 'foodcritic', 'Run foodcritic cookbook tests'
  def foodcritic
    say 'Run foodcritic..', :green
    review = FoodCritic::Linter.new.check(
      cookbook_paths: '.',
      tags: [],
      include_rules: ['foodcritic/etsy', 'foodcritic/customink'],
      fail_tags: ['any']
    )

    if review.warnings.any?
      puts review
      exit !review.failed?
    else
      say 'No foodcritic errors', :green
    end
  end

  desc 'rubocop', 'Run rubocop on all Ruby files'
  def rubocop
    say 'Run rubocop...', :green
    check_system 'rubocop', 'Gemfile', 'Berksfile', 'metadata.rb', 'attributes', 'recipes', 'templates', "#{ __FILE__ }"
  end

  desc 'all', 'Run all style on cookbooks'
  def all
    say 'Run all style...', :green
    invoke :knife
    invoke :foodcritic
    invoke :rubocop
  end
end

# unit tests
class Unit < Thor
  include SystemExec

  desc 'spec', 'Run ChefSpec examples'
  def spec
    say 'Run ChefSpec examples...', :green
  end

  desc 'all', 'Run unit tests'
  def all
    say 'Run unit tests...', :green
    invoke :spec
  end
end

# integration tests
class Integration < Thor
  include SystemExec

  desc 'kitchen', 'Run Test Kitchen with Vagrant (BATS, Minitest, Serverspec)'
  def kitchen
    say 'Run Test Kitchen with Vagrant...', :green
    check_system 'bundle', 'exec', 'kitchen', 'test'
  end

  desc 'all', 'Run integration tests'
  def all
    say 'Run integration tests...', :green
    invoke :kitchen
  end
end

# wrap them all
class Tests < Thor
  desc 'all', 'Run tests'
  def all
    say 'Run tests...', :green
    invoke 'style:all'
    invoke 'unit:all'
    invoke 'integration:all'
  end
end
