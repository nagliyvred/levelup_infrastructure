metadata :name => "deploy",
         :description => "agent to deploy packages",
         :author => "Evgeny ",
         :license => "MIT",
         :version => "1.0",
         :url => "http://",
         :timeout => 60 
# bla
action "deploy", :description => "deploy process" do
     # Example Input
     input :version,
    :prompt => "version to be deployed",
    :type => :string,
    :optional => false,
    :description => "version",
    :validation => '[0-9].[0-9]+',
    :maxlength => 20
     # Example output
     output :msg,
    :description => "result",
    :display_as => "message"

end
