out13 Polyglot Vagrant 
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
v [mm, mp, py, js, db]
v ss [mm, mp, py, js, db]
```

Components/ Manifests for [Nodes]
--------------------

* RVM / Ruby (2.0.0-p353) 
* Rails
* Nginx + Passenger
* PostgreSQL
* MongoDB
* Redis
* Node.js
* Java
* Scala
* Erlang
* Python
* Memcached
* Heroku Toolbelt


Benchmark 
-----

**Puppet finished catalog run in seconds**

```shell

```


Hints
-----

**Provisioning**

To provision again in case of update or errors while the virtual machine is already up, use:

```shell
vagrant provision [mm, mp, py, js, db]
```
It just runs puppet to apply manifests without restarting the virtual machine.

**Startup speed**

To speed up the startup process after the first run, use:

```shell
vagrant up [mm, mp, py, js, db] --no-provision
```
It just starts the virtual machine without provisioning of the puppet recipes.

Bash Binaries
-----

**To start Vagrant instance node**

```shell
v [mm, mp, py, js, db] environments in parallel
```

**To halt**

```shell
v h [mm, mp, py, js, db]
```

**To destroy**

```shell
v d [mm, mp, py, js, db]
```

**To destroy and start again**

```shell
v du [mm, mp, py, js, db]
```

**To provision Vagrant instance with puppet**

```shell
v pr [mm, mp, py, js, db]
```

**To shortcut to ssh into Vagrant node instances**

```shell
ss [mm, mp, py, js, db]
```

**To suspend / resume / up**

```shell
v [mm, mp, py, js, db] - suspends / resumes / up's ( checks status )
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
