set :application, "Life-Style"
server "lifestylesalonnyc.com", :app, :web, :db, :primary => true

set :scm, :git
set :repository,  "git@github.com:innovia/Life-Style.git"
set :scm_passphrase, "deploy4733" 
set :branch, "origin/master"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :deploy_to, "/var/www/apps/#{application}"
set :deploy_via, :remote_cache
set :runner, nil


namespace :deploy do
  desc "Deploy the MFer"
  task :default do
    update
    restart
    cleanup
  end
 
  desc "Setup a GitHub-style deployment."
  task :setup, :except => { :no_release => true } do
    run "git clone #{repository} #{current_path}"
  end
 
  desc "Update the deployed code."
  task :update_code, :except => { :no_release => true } do
    run "cd #{current_path}; git fetch origin; git reset --hard #{branch}"
  end
 

  desc "Shrink and bundle js and css"
  task :bundle, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path}; RAILS_ROOT=#{current_path} rake bundle:all"
  end


end