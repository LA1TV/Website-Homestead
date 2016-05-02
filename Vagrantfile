VAGRANTFILE_API_VERSION = "2"

path = "#{File.dirname(__FILE__)}"

require 'yaml'
require path + '/scripts/homestead.rb'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  Homestead.configure(config, YAML::load(File.read(path + '/LA1TV-Website-Homestead.yaml')))
  config.vm.provision "shell", path: "scripts/provision.sh"
  config.vm.provision :shell, path: "scripts/startup.sh", run: "always", privileged: false
end
