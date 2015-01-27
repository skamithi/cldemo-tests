#!/bin/bash

if [ $(id -u) -ne 0 ]
then
  echo "Please run this script as root"
  exit 1
fi

# Add the Brightbox Ruby repo
apt-key adv --keyserver keyserver.ubuntu.com --recv C3173AA6

cat > /etc/apt/sources.list.d/brightbox_ruby_stable.list << _EOF
deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu precise main 
deb-src http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu precise main
_EOF

# Install Ruby 2.1 from Brightbox and set up for Serverspec
apt-get update -y
apt-get install -y ruby2.1 rubygems
apt-get autoremove -y
gem install bundler
bundle install --without test
