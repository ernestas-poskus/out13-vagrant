 #!/usr/bin/env bash

echo 'Updating gems'
gem update --system

echo 'Installing Puppet & dependencies'
gem install puppet 

echo 'Installing Rails'
gem install rails 

echo 'Installing Further gems'
gem install capistrano