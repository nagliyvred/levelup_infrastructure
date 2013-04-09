module MCollective
  module Agent
    class Sync<RPC::Agent
      action "sync" do
 
        msg = []  
        Log.info("syncronising host repo - revision #{request[:revision]}")
        status = run('git pull', :stdout => msg, :stderr => msg, :cwd => "/data/puppet_code/levelup_infrastructure/")
        if status != 0
          Log.info("git pull failed: #{status} #{msg}")
          reply[:msg] = "sync FAILED: #{msg}"
          reply[:status] = status
          return
        end

        status = run("git checkout HEAD", :stdout => msg, :stderr => msg, :cwd => "/data/puppet_code/levelup_infrastructure/")
        if status != 0
          Log.info("git checkout status: #{status} #{msg}")
          reply[:msg] = "sync FAILED: #{msg}"
          reply[:status] = status
          return
        end
        Log.info("sync done: #{msg}")
        reply[:msg] = "sync SUCCESS"
      end

    end
  end
end
