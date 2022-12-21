# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    if Vagrant.has_plugin?("vagrant-vbguest")
        config.vbguest.auto_update = false
    end

    config.vm.box = "ubuntu/jammy64"
    config.vm.hostname = "vagrant-router"

    config.vm.provider "virtualbox" do |v|
        v.gui = false
        v.memory = 1024
        v.cpus = 2
    end

    config.vm.network "public_network", ip: "172.16.1.1", netmask:"255.255.0.0", bridge: "en0: Ethernet"

    #Bootstrap services.
    config.vm.provision :shell, path: "vm_bootstrap.sh"

end