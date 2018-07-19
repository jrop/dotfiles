#!/bin/sh

# Install ansible
sudo apt-get update
sudo apt-get install -y software-properties-common unzip
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

# Download this repo and install dotfiles
wget https://github.com/jrop/dotfiles/archive/master.zip
unzip master.zip
cd dotfiles-master
ansible-galaxy install -r requirements.yml -p roles
ansible-playbook playbook.yml
