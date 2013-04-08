module MCollective
  module Agent
    class Sync<RPC::Agent
      action "sync" do
 
        msg = ""  
        puts "running sync"
        run('git pull', :stdout => msg, :stderr => msg, :cwd => "/data/puppet_code/levelup_infrastructure/")
        run("git checkout HEAD", :stdout => msg, :stderr => msg)
        puts "sync done: #{msg}"
        reply[:msg] = "#{msg}\nsynced OK"
      end

    end
  end
end
