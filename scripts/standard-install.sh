#!/bin/bash

source ./common.sh

if [ ! -f /etc/dist-upgraded ]; then
    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
    touch /etc/dist-upgraded
fi

if ! which add-apt-repository >> /dev/null; then
    installing "Software Properties Common & Build Essential"
    apt-get install -y software-properties-common build-essential
fi

source ./install-curl.sh
source ./install-unzip.sh
source ./install-jq.sh

source ./install-ntp.sh
source ./install-git.sh
source ./install-docker.sh
source ./install-nano.sh
source ./install-zsh.sh

if [ -f /vagrant/ubuntu-xenial-16.04-cloudimg-console.log ]; then
    rm /vagrant/ubuntu-xenial-16.04-cloudimg-console.log
fi