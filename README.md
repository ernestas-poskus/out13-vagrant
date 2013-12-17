Ruby / Rails development environment - out13-vagrant 
=============

Installation
------------

* Install Git, Ruby
* Install Ruby DevKit [GitHub Devkit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit)
* Install VirtualBox using the packages at [Download VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install Vagrant using the installation instructions in the [Getting Started document](http://vagrantup.com/v1/docs/getting-started/index.html)
* run the following commands:

```shell
gem install puppet librarian-puppet
gem install bundler
vagrant plugin install vagrant-vbguest
vagrant box add vagrant-rails-dev http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-1204-x64.box
git clone https://github.com/ernestas-poskus/out13-vagrant
cd out13-vagrant
bundle install
cd out13-vagrant/puppet
ruby resolve_dependencies.rb
cd ..
vagrant up
vagrant ssh
```

Installed components
--------------------

* RVM / Ruby (2.0.0-p247) / Rails (4.0.2)
* Nginx
* PostgreSQL
* Node.js
* MongoDB
* Redis

Optional:
* MySQL
* Memcached
* Heroku / Toolbelt

Hints
-----

**Provisioning**

To provision again in case of update or errors while the virtual machine is already up, use:

```shell
vagrant provision
```
It just runs puppet to apply manifests without restarting the virtual machine.

**Startup speed**

To speed up the startup process after the first run, use:

```shell
vagrant up --no-provision
```
It just starts the virtual machine without provisioning of the puppet recipes.
