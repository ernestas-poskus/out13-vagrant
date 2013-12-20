#!/bin/bash
apt-get update
apt-get upgrade
rvm requirements
rvm rubygems current || echo 'rubygems current'
gem list | grep 'puppet' || gem install puppet
apt-get install libaugeas-ruby