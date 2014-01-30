Vagrant Multi-Node environment
=============

Installation
------------

* Install Git, Ruby
* Install Ruby DevKit [GitHub Devkit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit)
* Install VirtualBox using the packages at [Download VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install Vagrant using the installation instructions in the [Getting Started document](http://vagrantup.com/v1/docs/getting-started/index.html)
* run the following commands:

```shell
git clone https://github.com/ernestas-poskus/out13-vagrant
cd out13-vagrant
gem install bundler
bundle install
cd out13-vagrant/puppet
ruby resolve_dependencies.rb
cd ..
vagrant up [main, js, db]
vagrant ssh [main, js, db]
```

Installed components
--------------------

* RVM / Ruby (2.0.0-p353) 
* Rails (4.0.2) 
* Nginx + Passenger
* PostgreSQL
* MongoDB
* Redis
* Node.js

**Optional:**

* PostgreSQL / MongoDB
* Memcached
* Heroku / Toolbelt

Hints
-----

**Provisioning**

To provision again in case of update or errors while the virtual machine is already up, use:

```shell
vagrant provision [main, js, db]
```
It just runs puppet to apply manifests without restarting the virtual machine.

**Startup speed**

To speed up the startup process after the first run, use:

```shell
vagrant up --no-provision
```
It just starts the virtual machine without provisioning of the puppet recipes.

Bash Binaries
-----

**To start main Vagrant instance node**

```shell
dev - to start [main, db] environments in parallel
dev js - to start node.js + mongodb environment
```

**To destroy and start again**

```shell
du [main, js, db]
```

**To provision Vagrant instance with puppet**

```shell
pr [main, js, db]
```

**Shortcut to ssh into Vagrant node instances**

```shell
ss [main, js, db]
```

**To bring up several nodes in parallel without provision**


```shell
up [main, js, db]
```


### MIT License 

Copyright (C) 2012 by Ernestas Poškus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN