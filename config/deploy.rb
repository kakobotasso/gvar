# application domain
set :application, "192.34.58.203"

# how many releases should be kept in releases directory
set :keep_releases, 5

# to deploy using git:
# set :scm, "git"
# set :repository,  "git@codeplane.com:fnando/hackerboard.git"
# set :branch, "master"

# to deploy without git:
set :repository, "."
set :scm, :none

# the deployer user
set :user, "deploy"

# the application deployment path
set :deploy_to, "/var/www/gvar"
set :deploy_via, :copy
set :copy_strategy, :export

# the ssh port
set :port, 22

# do not run commands as sudoer
set :use_sudo, false

# do forward SSH key.
ssh_options[:forward_agent] = true

# set the roles
role :app, application
role :web, application
role :db,  application, :primary => true

# After deploying, run some tasks
after "deploy", "app:setup"
after "deploy", "app:assets"
after "deploy", "deploy:cleanup"

# We're not managing app booting, so
# override default tasks.
namespace :deploy do
  task(:start) {}
  task(:stop) {}
  task(:restart) {}
end

namespace :app do
  desc "Symlink all configuration files"
  task :setup do
    {
      "database.yml"           => "config/database.yml"
    }.each do |from, to|
      run "rm -f #{current_path}/#{to}; ln -s #{deploy_to}/config/#{from} #{current_path}/#{to}"
    end
  end

  desc "Precompile assets"
  task :assets do
    run "cd #{current_path} && RAILS_ENV=production RAILS_GROUPS=assets bundle exec rake assets:precompile"
  end
end
