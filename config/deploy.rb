set :application, "deca"
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# name of the user deploying the application
set :user, "deployer"

# deployment path
set :deploy_to, "/usr/local/projects/#{application}"

# scm 
set :scm, :git
set :scm_passphrase, ""
set :branch, "master"
set :deploy_via, :remote_cache
set :repository,  "git@github.com:waynegraham/DECA.git  "

set :domain, "deca.scholarslab.org"

role :app, domain
role :web, domain
role :db, domain, :primary => true

set :runner, "deployer"
set :rails_env, "production"

