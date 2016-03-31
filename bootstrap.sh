#!/bin/bash
sudo apt-get update
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:saltstack/salt
sudo apt-get update
sudo apt-get -y install salt-minion salt-common git

rm -rf goldorak-operations
git clone https://github.com/cvra/goldorak-operations.git

sudo salt-call --local --file-root=goldorak-operations/salt/roots state.highstate

sudo reboot
