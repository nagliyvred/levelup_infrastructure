metadata :name => "sync",
         :description => "agent to sync source code",
         :author => "Evgeny ",
         :license => "MIT",
         :version => "1.0",
         :url => "http://",
         :timeout => 60 
# bla
action "sync", :description => "deploy process" do
     # Example Input
     input :revision,
    :prompt => "revision to be synced to ",
    :type => :string,
    :optional => false,
    :description => "revision",
    :validation => '[a-zA-Z0-9]{40}',
    :maxlength => 40
     # Example output
     output :msg,
    :description => "result",
    :display_as => "message"

end
