# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

def clean(_git_remote, heroku_app)
  Bundler.with_clean_env { sh "heroku pg:reset DATABASE_URL --app #{heroku_app} --confirm #{heroku_app}" }
  Bundler.with_clean_env { sh "heroku run rake db:migrate db:seed --app #{heroku_app}" }
  Bundler.with_clean_env { sh "heroku restart --app #{heroku_app}" }
end

def deploy(git_remote, _heroku_app, branch = 'master')
  Bundler.with_clean_env { sh "git push -f #{git_remote} #{branch}:master" }
end

namespace :heroku do
  desc 'Clean deploy to heroku staging'
  task :clean_staging do
    clean('heroku', 'stc-ytk-staging')
  end

  desc 'Clean deploy to heroku staging'
  task clean_deploy_staging: [:clean_staging] do
    deploy('heroku', 'stc-ytk-staging')
  end
end

if Rails.env.test? || Rails.env.development?
  require 'rspec/core/rake_task'

  namespace :ci do
    desc 'Run specs'
    RSpec::Core::RakeTask.new(:spec)

    desc 'Run all CI tests'
    task test: [:spec]
  end
end