 #!/usr/bin/env bash

echo 'Installing RVM'

# Not installing rdoc and ri
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

# Load RVM at each login.
echo "[[ -s '${HOME}/.rvm/scripts/rvm' ]] && source '${HOME}/.rvm/scripts/rvm'" >> ~/.bashrc

curl -L https://get.rvm.io | bash -s stable

echo 'Sourcing RVM'
source ~/.rvm/scripts/rvm

echo 'Reloading RVM'
rvm reload

echo 'Checking RVM requirements'
rvm requirements

echo 'Reloading RVM'
rvm reload

echo 'Installing Ruby'
rvm install 2.0.0

rvm use 2.0.0 --default

echo 'Ruby Version Installed'
ruby --version


echo 'Installing Puppet'
sudo apt-get -y install puppet