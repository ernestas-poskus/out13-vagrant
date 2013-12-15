out13-vagrant
=============

Installation
------------

* Install git, Ruby
* Install Ruby DevKit [GitHub Devkit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit)
* Install VirtualBox using the packages at [Download VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install vagrant using the installation instructions in the [Getting Started document](http://vagrantup.com/v1/docs/getting-started/index.html)
* run the following commands:

```shell
gem install puppet librarian-puppet
gem install bundler
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
* Node.js
* MySQL
* PostgreSQL
* MongoDB
* Memcached
* Redis


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
