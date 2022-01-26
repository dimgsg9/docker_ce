# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian/buster64"

  config.vm.network "private_network", ip: "192.168.10.20"
 

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder "code/", "/home/vagrant/code", create: true

  config.vm.provision :shell, path: "bootstrap.sh"

end
