#!/usr/bin/env bash

echo 'Installing node.js'
apt-get install -y python-software-properties python g++ make && add-apt-repository -y ppa:chris-lea/node.js && apt-get update && apt-get install -y nodejs