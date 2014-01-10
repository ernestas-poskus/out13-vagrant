 #!/usr/bin/env bash

echo 'Installing dependencies'
# Add MongoDB provider to apt
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/10gen.list

apt-get update 
apt-get install -y build-essential curl wget git-core autoconf openssl automake libtool pkg-config bison ncurses-dev
apt-get install -y libreadline6 libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev libc6-dev libcurl4-openssl-dev # Libraries

# Additional Tools
apt-get install -y htop

# Sqlite
apt-get install -y libsqlite3-0 libsqlite3-dev sqlite3 

# PostgreSQL library
apt-get install -y libpq-dev # postgresql postgresql-client libpq-dev
