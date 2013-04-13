module MCollective
  module Agent
    class Deploy<RPC::Agent
      action "deploy" do
          version = request[:version] 
          Log.info("Deploying version #{version}")

          msg = ""  
          status = run('dpkg -r testinvaders', :stdout => msg, :stderr => msg)
          if status != 0 
            Log.info("Failed to remove: #{msg}")
            reply[:msg] = "deployment FAILED: #{msg}"
            reply[:status] = status
            return
          end

          status = run("apt-get update && apt-get install testinvaders=#{version}  --yes --force-yes", :stdout => msg, :stderr => msg)
          if status != 0 
            Log.info("Failed to remove: #{msg}")
            reply[:msg] = "deployment FAILED: #{msg}"
            reply[:status] = status
            return
          end
          Log.debug("deploy finished with: #{msg}")
          reply[:msg] = "deployment SUCCESS"
      end

    end
  end
end
