# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
 
  # Global Config 

  # Headless / Clean / Puppet/Ruby-less box
  config.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210-nocm.box'

  # Installing Puppet
  config.vm.provision :shell, inline: "apt-get update && apt-get install -y puppet"



  # Main Vagrant Instance
  config.vm.define :main, primary: true do |main|
  
    main.vm.box = 'main'
    main.vm.hostname = 'main'

    # Network address
    main.ssh.forward_agent = true
    main.vm.network :private_network, ip: "192.168.110.110"
    main.vm.network :forwarded_port, guest: 3000, host: 3000

    # Sync Files
    main.vm.synced_folder "vm_main/", "/var/www", :nfs => true

    # VirtualBox
    main.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", "1024"] 

      # Enables Symlinks
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vm_main", "1"]
    end
  
  end



  # Node.js / JavaScript development Vagrant Instance
  config.vm.define :js do |js|

    js.vm.box = 'js'
    js.vm.hostname = 'js'

    # Network address
    js.ssh.forward_agent = true
    js.vm.network :private_network, ip: "192.168.120.120"
    js.vm.network :forwarded_port, guest: 3000, host: 3000

    # Sync Files
    js.vm.synced_folder "vm_js/", "/vagrant", :nfs => true

    # VirtualBox
    js.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", "1024"] 

      # Enables Symlinks
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vm_js", "1"]
    end
  end




  # PostgreSQL worker
  config.vm.define :db do |db|

    db.vm.box = 'db'
    db.vm.hostname = 'db'

    # Network address
    db.vm.network :private_network, ip: "192.168.130.130"
    db.ssh.forward_agent = true

    # VirtualBox
    db.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", "512"] 
    end
  end



  # Puppet Configuration / Manifests 
  config.vm.provision :puppet do |pp|
    pp.options            = "--verbose --summarize --debug"
    pp.manifests_path     = "puppet/manifests"
    pp.module_path        = "puppet/modules"
    pp.manifest_file      = "init.pp"
    pp.facter = {
      'ruby_version_install'  => '2.0.0-p353',
      'postgresql_port'       => 5432, # Default PostgreSQL port 5432
      'mongo_port'            => 27017, # Default MongoDB port 27017
      'redis_port'            => 6379, # Default Redis port 6379
    }
  end


end
