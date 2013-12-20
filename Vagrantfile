# @Author: Ernestas Poskus
# @Author-URI: out13.com

# @LinkedIn: linkedin.com/in/ernestasposkus/
# @GitHub: github.com/ernestas-poskus

# -----
# Project: Vagrant + Puppet
# @date: 2013-12


# Vagrant version 2
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box       = 'vagrant-ruby-dev'
  # config.vm.box_url   = 'http://files.vagrantup.com/precise32.box'
  config.vm.box_url   = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210-nocm.box'
  config.vm.hostname = 'vagrant-ruby-dev'
  
  ##############################################################################################
  
  # SSH
  #config.ssh.username = "vagrant"
  #config.ssh.host = ""
  #config.ssh.port = '22'
  #config.ssh.private_key_path
  config.ssh.forward_agent = true

  config.vm.provision :shell do |shell|
    shell.inline = '
    which rvm || \curl -sSL https://get.rvm.io | bash -s stable --ruby;
    usermod -a -G rvm vagrant;
    chown -R vagrant:rvm /usr/local/rvm;
    '
  end
  
  config.vm.provision "shell", path: "depend.sh", privileged: false

  ##############################################################################################
  
  # Network
  config.vm.network :private_network, ip: "192.168.13.13"
  
  # Create a public network, which generally matched to bridged network.
  # config.vm.network :public_network
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  ##############################################################################################
  
  # File System
  # Bridged networks make the machine appear as another physical device on your network.
  config.vm.synced_folder "vag", "/vagrant", :nfs => true
    
  ##############################################################################################
  
  # VirtualBox
  config.vm.provider :virtualbox do |vbox|
    # Don't boot with headless mode
    # vbox.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    vbox.customize ["modifyvm", :id, "--memory", "1024"]
	
  end
  
  ##############################################################################################
  
  # Puppet Configuration / Manifests 
  config.vm.provision :puppet do |puppet|
    puppet.options = "--verbose --summarize --debug"
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "init.pp"
  end
	
end

