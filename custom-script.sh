#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb

# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-cache policy docker-ce
apt-get install -y docker-ce
# Add vagrant user to Docker group
usermod -aG docker vagrant
# Start Docker on boot
systemctl enable docker

# Install docker compose
curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install nodejs, git, php
echo "Add NodeSource Personal Package Archive and install nodejs"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && sudo apt-get update && sudo apt-get -y install nodejs
echo "Install git"
apt-get -y install git
echo "Install PHP"
apt-get -y install php-fpm php php-cli