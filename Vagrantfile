# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Shamelessly stolen from http://github.com/ChrisMacNaughton/BtSync

Vagrant.configure("2") do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu-12.04-updated"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://static.aldoborrero.com/vagrant/quantal64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 3000, host: 8000

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['chef/cookbooks', 'cookbooks']
    chef.roles_path = 'chef/roles'
    chef.add_role 'bitbox'
  end
end
