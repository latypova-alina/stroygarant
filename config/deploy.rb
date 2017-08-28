set :application, 'stroygarant.moscow'
set :repo_url, 'git@bitbucket.org:gstudiocom/stroygarant.git'

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system front/bower_components front/node_modules)

set :assets_prefix, 'rails_assets'

desc "Tail logs"
task :logs do
  on roles(:app), in: :sequence, wait: 5 do
    execute "tail -n 500 -f #{release_path}/log/#{fetch(:stage)}.log" do |channel, stream, data|
      puts  # for an extra line break before the host name
      puts "#{channel[:host]}: #{data}"
      break if stream == :err
    end
  end
end

namespace :deploy do

  desc 'Build dist'
  task :build do
    on roles(:app) do
      info "Gulp build task"
      execute "cd #{release_path}/front && gulp"
    end
  end

  desc 'Update packages'
  task :update_packages do
    on roles(:app) do
      info "Update npm and bower packages"
      execute "cd #{release_path}/front && npm install && bower install"
    end
  end

end

#after 'deploy:updated', 'deploy:update_packages'
#after 'deploy:update_packages', 'deploy:build'