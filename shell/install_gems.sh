 #!/usr/bin/env bash
echo 'Updating gems'
gem update --system

echo 'Installing Puppet & dependencies'
gem install puppet monit #  ruby-augeas # Puppet / Monit interface / Augeas interface

echo 'Installing Rails'
# gem install rails

echo 'Install mongoid ODM & mongo_mapper ORM'
# gem install mongoid mongo_mapper

echo 'Installing Further gems'
# gem install capistrano redis