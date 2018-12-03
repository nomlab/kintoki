# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  # FIXME
  # can't get package "linux-source-3.16" in debian-stretch
  # doesn't use ssh in debian-jessie
  # config.vm.box = "debian/stretch64"
  # config.vm.box = "debian/jessie64"
  config.vm.box = "ARTACK/debian-jessie"
  config.vm.box_url = "https://atlas.hashicorp.com/ARTACK/boxes/debian-jessie"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.define "target" do |target|
    target.vm.hostname = "target"
    target.vm.network "private_network", ip: "192.168.33.10"
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
    target.vm.provider "virtualbox" do |vb_t|
  # Customize serial console
      vb_t.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
      vb_t.customize ["modifyvm", :id, "--uartmode1", "tcpserver", "22222"]
  # Customize the amount of memory on the VM:
      vb_t.memory = "2048"
      vb_t.memory = "4"
    end
  # first setting target
    target.vm.provision "shell", path: "scripts/setup_target.sh"
  end
  
  config.vm.define "observer" do |observer|
    observer.vm.hostname = "observer"
    observer.vm.network "private_network", ip: "192.168.33.20"
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
    observer.vm.provider "virtualbox" do |vb_o|
  # Customize the amount of memory on the VM:
      vb_o.memory = "2048"
      vb_o.cpu = "2"
    end
  # first setting observer
    observer.vm.provision "shell", path: "scripts/setup_observer.sh"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  config.vbguest.auto_update = false
  config.vbguest.no_remote = true
end
