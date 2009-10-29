Capistrano::Configuration.instance(:must_exist).load do
  namespace :unicorn do
    desc <<-DESC
    Start the Unicorn Master.  This uses the :use_sudo variable to determine whether to use sudo or not. By default, :use_sudo is set to true.
    DESC
    task :start, :roles => [:app], :except => {:unicorn => false} do
      sudo "/etc/init.d/unicorn_#{application} start"
    end

    desc <<-DESC
    Restart the Unicorn processes on the app server by starting and stopping the master. This uses the :use_sudo variable to determine whether to use sudo or not. By default, :use_sudo is set to true.
    DESC
    task :restart, :roles => [:app], :except => {:unicorn => false} do
      sudo "/etc/init.d/unicorn_#{application} restart"
    end

    desc <<-DESC
    Stop the Unicorn processes on the app server.  This uses the :use_sudo
    variable to determine whether to use sudo or not. By default, :use_sudo is
    set to true.
    DESC
    task :stop, :roles => [:app], :except => {:unicorn => false} do
      sudo "/etc/init.d/unicorn_#{application} stop"
    end

    desc <<-DESC
    Reloads the unicorn works gracefully - Should be used on deploy 
    DESC
    task :reload, :roles => [:app], :except => {:unicorn => false} do
      sudo "/etc/init.d/unicorn_#{application} reload"      
    end
    
    desc <<-DESC
    Adds a Unicorn worker - Beware of causing your host to swap, this setting isn't permanent
    DESC
    task :reload, :roles => [:app], :except => {:unicorn => false} do
      sudo "/etc/init.d/unicorn_#{application} aworker"      
    end
    
    desc <<-DESC
    Removes a unicorn worker (gracefully) 
    DESC
    task :reload, :roles => [:app], :except => {:unicorn => false} do
      sudo "/etc/init.d/unicorn_#{application} rworker"      
    end
  end #namespace
end #Capistrano::Configuration
