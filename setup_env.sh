#!/bin/sh
#

sudo apt-get -y install juju juju-local charm-tools git
juju init
juju bootstrap -e local
mkdir -p ~/workspace/charms/layers
echo "export JUJU_REPOSITORY=$HOME/workspace/charms" >> ~/.bashrc
echo "export LAYER_PATH=$JUJU_REPOSITORY/layers" >> ~/.bashrc
echo "export INTERFACE_PATH=$JUJU_REPOSITORY/interfaces" >> ~/.bashrc
source ~/.bashrc

sudo pip3 install gitpython
