module MCollective
  module Agent
    class Deploy<RPC::Agent
      action "deploy" do
  
  msg = ""  
  run('dpkg -r testinvaders', :stdout => msg, :stderr => msg)
  run("apt-get update && apt-get install testinvaders  --yes --force-yes", :stdout => msg, :stderr => msg)
  reply[:msg] = "#{msg}\ndeployed OK"
      end

    end
  end
end
