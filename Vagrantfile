# @Author: Ernestas Poskus
# @Author-URI: out13.com

# @LinkedIn: linkedin.com/in/ernestasposkus/
# @GitHub: github.com/ernestas-poskus

# -----
# Project: Vagrant + Shell + Puppet
# @date: 2013-11
# @updated: 2014-01


$VM_NAME = 'outdev'
$INSTALL_RUBY_VERSION = 'ruby-2.0.0-p353' # Date @2014-01 / Puppet does not support ruby-2.1.0

# Vagrant version 2
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = $VM_NAME
  config.vm.hostname = $VM_NAME
  config.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210-nocm.box'
  
  ##############################################################################################
  
  # SSH
  #config.ssh.username = "vagrant"
  #config.ssh.host = ""
  #config.ssh.port = '22'
  #config.ssh.private_key_path
  config.ssh.forward_agent = true

  config.vm.provision :shell, :privileged => true, :path => "shell/install_dependencies.sh"
  config.vm.provision :shell, :privileged => true, :path => "shell/install_rvm.sh", :args => $INSTALL_RUBY_VERSION
  config.vm.provision :shell, :privileged => true, :path => "shell/install_gems.sh"
  config.vm.provision :shell, :privileged => true, :path => "shell/install_nodejs.sh"
  config.vm.provision :shell, :privileged => true, :path => "shell/install_passenger.sh"
  config.vm.provision :shell, :privileged => true, :path => "shell/install_user.sh"

  ##############################################################################################
  
  # Network
  config.vm.network :private_network, ip: "192.168.13.13"
  
  # Create a public network, which generally matched to bridged network.
  # config.vm.network :public_network
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  ##############################################################################################
  
  # File System
  # Bridged networks make the machine appear as another physical device on your network.
  config.vm.synced_folder "vm/", "/vagrant", :nfs => true

 ##############################################################################################
  
  # VirtualBox
  config.vm.provider :virtualbox do |v|

  	v.name = $VM_NAME
    v.customize ["modifyvm", :id, "--memory", "1024"] 

    # Enables Symlinks
	  v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  ##############################################################################################
  
  # Puppet Configuration / Manifests 
  config.vm.provision :puppet do |pp|
    pp.options            = "--verbose --summarize --debug"
    pp.manifests_path     = "puppet/manifests"
    pp.module_path        = "puppet/modules"
    pp.manifest_file      = "init.pp"
  end
	
end

