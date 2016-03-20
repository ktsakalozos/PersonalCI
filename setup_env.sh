#!/bin/sh
#

sudo apt-get -y install juju juju-local charm-tools git python3
sudo pip3 install gitpython
juju init -f
juju bootstrap -e local 
juju switch local
juju status
#mkdir -p ~/workspace/charms/layers
#echo "export JUJU_REPOSITORY=$HOME/workspace/charms" >> ~/.bashrc
#echo "export LAYER_PATH=$JUJU_REPOSITORY/layers" >> ~/.bashrc
#echo "export INTERFACE_PATH=$JUJU_REPOSITORY/interfaces" >> ~/.bashrc
#source ~/.bashrc

