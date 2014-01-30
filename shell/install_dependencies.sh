 #!/usr/bin/env bash

echo 'Installing dependencies'
# Add MongoDB provider to apt
# apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
# echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/10gen.list

echo 'apt-get update'
apt-get update 

echo 'Installing essentials'
apt-get install -y \
	build-essential \
	curl \
	wget \
	git-core \
	autoconf \
	openssl \
	automake \
	libtool \
	bison \
	ncurses-dev \
	gawk \
	pkg-config
	# software-properties-common \ # manage the repositories that you install software from (common)

echo 'Installing Libraries'
apt-get install -y \
	libreadline6 \
	libreadline6-dev \
	zlib1g-dev \
	libssl-dev \
	libyaml-dev \
	libxml2-dev \
	libxslt-dev \
	libgdbm-dev \
	libffi-dev \
	libc6-dev \
	libcurl4-openssl-dev 

echo 'Installing additional tools'
apt-get install -y \
	htop \ # Live processes monitoring
	monit # Service monitoring

# apt-get install -y libaugeas-ruby augeas-tools libaugeas-dev # augueas - tree configuration

echo 'Installing SQLite'
apt-get install -y \
	libsqlite3-0 \
	libsqlite3-dev \
	sqlite3 

# PostgreSQL library
apt-get install -y libpq-dev # postgresql postgresql-client libpq-dev libpq5

echo 'Setting Locale/Language'
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8