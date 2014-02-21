# -*- mode: ruby -*-
# vi: set ft=ruby :


boxes = [
	
    # Node Main + Rails + MongoDB
    { 
        :name => :mm, 
        :ip => '192.168.110.110',
        :port => [ { 3000 => 3000 } ],
        :mount => [ { '/var/www' => 'vm_mm' } ],
        :memory => 1024,
    },

    # Node Main + Rails + PostgreSQL
    { 
         :name => :mp, 
         :ip => '192.168.110.110',
         :port => [ { 3000 => 3000 } ],
         :mount => [ { '/var/www' => 'vm_mp' } ],
         :memory => 1024,
    },

    # Python development environment
    { 
        :name => :py, 
        :ip => '192.168.115.115',
        :port => [ { 3000 => 3000 } ],
        :mount => [ { '/vagrant' => 'vm_py' } ],
        :memory => 1024,
    },

    # Node, Node.js & MongoDB environment
    { 
        :name => :js, 
        :ip => '192.168.120.120',
        :port => [ { 3000 => 3000 } ],
        :mount => [ { '/vagrant' => 'vm_js' } ],
        :memory => 1024,
    },

    # PostgreSQL & MongoDB remote servers
    { 
        :name => :db, 
        :ip => '192.168.130.130',
        :memory => 512,
    },
]


Vagrant.configure('2') do |config|

    boxes.each do |opts|

        config.vm.define opts[:name] do |c|

        # Box basics
        c.vm.box = "ubuntu-1310-x64"
        c.vm.hostname = opts[:name]


        # Headless / Clean / Puppet/Ruby-less box
        c.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-x64-virtualbox-nocm.box'
        

        # Installing Puppet
        c.vm.provision :shell, inline: "apt-get update && apt-get install -y puppet"


        c.ssh.forward_agent = true
        c.vm.network :private_network, ip: opts[:ip]
        
        unless opts[:port].nil?
          opts[:port].each do |hash|
              hash.each do |guest, host|
                c.vm.network :forwarded_port, guest: guest, host: host
              end
          end
        end
    
        # Synced folders
        unless opts[:mount].nil?
          opts[:mount].each do |hash|
              hash.each do |host, guest|
                c.vm.synced_folder guest, host, :nfs => true
              end
          end
        end

        # VirtualBox
        c.vm.provider :virtualbox do |v|
          v.customize ["modifyvm", :id, "--memory", opts[:memory] ] 

          unless opts[:mount].nil?
            # Enables Symlinks
            v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
            v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
            v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/#{opts[:name]}", "1"]
          end
        end

        # Puppet Configuration / Manifests 
        c.vm.provision :puppet do |pp|
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
  end
end
