# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks
if Rails.env.test? || Rails.env.development?
  require 'rspec/core/rake_task'

  namespace :ci do
    desc 'Run specs'
    RSpec::Core::RakeTask.new(:spec)

    desc 'Run all CI tests'
    task test: [:spec]
  end
end