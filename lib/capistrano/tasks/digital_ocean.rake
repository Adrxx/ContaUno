namespace :ocean do

  desc "restart unicorn (Non zero downtime)"
  task :restart do
    on roles(:rootr) do
      execute "service unicorn restart"
    end
  end

  desc "Add the variables to bashrc"
  task :add_vars do
    on roles(:rootr) do
      execute "tail -n +25 /etc/default/unicorn > /home/rails/variables"
      execute "head -n +24 /etc/default/unicorn > header"
      execute "cat header > /etc/default/unicorn"
      execute "echo '. /home/rails/variables' >> /etc/default/unicorn"
      execute "echo '. /home/rails/variables' | cat - /home/rails/.bashrc > temp && mv temp /home/rails/.bashrc"
    end
  end

  desc "remove old rails_project"
  task :remove_old do
    on roles(:rootr) do
      execute 'rm -R /home/rails/rails_project/'
    end
    invoke "ocean:add_vars"
  end

  desc "Add ssh keys to server"
  task :add_keys do
    on roles(:rootr) do
      execute 'cat /etc/motd.tail'
    end
    role_properties(:rootr) do |hostname, role, props|
      run_locally do
        execute "cat ~/.ssh/id_rsa.pub | ssh rails@#{hostname} 'mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys'"
      end
    end
    invoke "ocean:remove_old"
  end

  desc "Add language vars"
  task :add_language do
    on roles(:rootr) do
      execute 'LANGUAGE="en_US.UTF-8"'
      execute 'LANGUAGE="en_US.UTF-8"'
      execute %Q[echo 'LANGUAGE="en_US.UTF-8"' >> /etc/default/locale]
      execute %Q[echo 'LC_ALL="en_US.UTF-8"' >> /etc/default/locale]
    end
    invoke "ocean:add_keys"
  end

  #SOLO CORRE ESTO Y YA ---> cap digital ocean:swap
  desc "Add swap file to  remote server."
  task :swap do
    on roles(:rootr) do
      execute 'sudo fallocate -l 4G /swapfile'
      execute 'ls -lh /swapfile'
      execute 'sudo chmod 600 /swapfile'
      execute 'sudo mkswap /swapfile'
      execute 'sudo swapon /swapfile'
      execute 'sudo swapon -s'
      execute 'free -m'
      execute "echo '/swapfile   none    swap    sw    0   0' >> /etc/fstab"
    end
    invoke "ocean:add_language"
  end

end

namespace :deploy do

  desc "Symlink current to rails proyect"
  task :add_symlink do
    on roles(:web) do
      execute 'ln -s /home/rails/current /home/rails/rails_project'
    end
  end

  after :finishing, :add_symlink

end
