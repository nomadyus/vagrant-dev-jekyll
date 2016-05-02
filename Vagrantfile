# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure(2) do |config|
    # Add Box to build the vagrant environment
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.hostname = "albatross"
    config.vm.network :private_network, ip: "192.168.33.10"
    
    # VirtualBox Specific Customization
    config.vm.provider :virtualbox do |vb|
        # Use VBoxManage to customize the VM. For example to change memory:
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        # Top level domain name
        vb.name = "albatross.dev"
    end
    
    # Use Puppet for provisioning
    config.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path = "puppet/modules"
        puppet.manifest_file = "default.pp"
        puppet.options = "--verbose --debug"
        # place main parent folder here
        config.vm.synced_folder "../", "/vagrant", id: "vagrant-root", owner:"root", group: "root"
    end
end
