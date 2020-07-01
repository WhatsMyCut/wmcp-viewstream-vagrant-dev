#!/bin/bash
# run as root
# sudo -i
# echo "debconf debconf/frontend select Noninteractive" | debconf-set-selections

# update package list
sudo apt-get -qq -y update && apt-get -qq -y upgrade
sudo apt-get -qq -y install --reinstall update-manager-core
# apt-get -qq -y install --install-recommends linux-generic-lts-xenial
# do-release-upgrade -y

# install some essentials
sudo apt-get -qq -y install apt-utils g++ build-essential git-core curl bash vim apt-transport-https ca-certificates bridge-utils gnupg-agent software-properties-common
# # install docker compose
sudo wget -qO- https://get.docker.com/ | sh

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" > docker-compose
sudo mv docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo apt-get -y -qq install docker-ce=18.06.1~ce~3-0~ubuntu
# make docker daemon available to the vagrant user
sudo gpasswd -a ${USER} docker
sudo service docker restart

# install Java 8
sudo add-apt-repository ppa:openjdk-r/ppa &&
sudo apt-get -qq -y update &&
sudo apt-get -qq -y install openjdk-8-jdk

# cleanup
sudo apt-get -qq -y autoremove

# install nvm
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# install node
nvm i 10

# setup shared network
sudo docker network create localnet

# cd to /vagrant by default
sudo echo "cd /vagrant" >> /home/vagrant/.bashrc

# copy docker utility scripts
sudo cp /vagrant/scripts/dev.sh /usr/local/bin/dev
sudo cp /vagrant/scripts/run.sh /usr/local/bin/run
sudo chmod +x /usr/local/bin/dev
sudo chmod +x /usr/local/bin/run

