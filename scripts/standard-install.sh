#!/bin/bash

source ./common.sh

if ! which add-apt-repository >> /dev/null; then
    installing "Software Properties Common & Build Essential"
    
    apt-get update
    apt-get install -y software-properties-common build-essential
fi

source ./install-curl.sh
source ./install-unzip.sh

source ./install-ntp.sh
source ./install-git.sh
source ./install-jq.sh
source ./install-docker.sh
source ./install-nano.sh
source ./install-zsh.sh

if [ -f /vagrant/ubuntu-xenial-16.04-cloudimg-console.log ]; then
    rm /vagrant/ubuntu-xenial-16.04-cloudimg-console.log
fi