require 'rubygems'
require 'puppet'
require 'rake/clean'
require 'rspec/core/rake_task'

@nodes = nil

BUILD_DIR='target'
CLEAN.include(BUILD_DIR)

PP_BASE="./puppet"
PP_MANIFESTS="#{PP_BASE}/manifests/main.pp"
PP_MODULES="#{PP_BASE}/modules"

def setup
  Puppet.settings.handlearg("--confdir", ".")
  Puppet.settings.handlearg("--manifest", PP_MANIFESTS)
  Puppet.settings.handlearg("--modulepath", PP_MODULES)
  Puppet.parse_config
end

def get_nodes(force_refresh = false)                                                                                         
  if (!@nodes || force_refresh)
    puts "loading nodes from #{PP_MANIFESTS} "
    Puppet.settings.handlearg("--manifest", PP_MANIFESTS)
    parser = Puppet::Parser::Parser.new("environment")
    @nodes = parser.environment.known_resource_types.nodes.keys
    end
  @nodes
end

def just_compile(nodes)
  failed_nodes = {}
  nodes.each do |node|
    success, message = compile_single_node(node)
    unless success
      failed_nodes[node] = message
    end
  end
  failed_nodes
end

def compile_single_node(nodename)
  puts "compiling #{nodename}"
  node = Puppet::Node.new(nodename)                                                         
  node.merge 'architecture' => 'x86_64', 'ipaddress' => '127.0.0.1', 'hostname' => nodename,
    'fqdn' => "#{nodename}.localdomain", 'operatingsystem' => 'redhat'
  Puppet::Parser::Compiler.compile(node)
end

desc "compile puppet catalogs"
task "puppet:verify" do

  nodes = get_nodes(true)

  just_compile(nodes)

    fail "Puppet compile failed" unless $?.exitstatus == 0
end


directory BUILD_DIR
