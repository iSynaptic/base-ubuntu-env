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

if ! apt list --installed 2>/dev/null | grep apt-transport-https > /dev/null 2>&1; then
    apt-get install -y apt-transport-https
fi

source ./install-curl.sh
source ./install-zip-tools.sh
source ./install-jq.sh
source ./install-gron.sh

source ./install-gpg2.sh
source ./install-gopass.sh
source ./install-ssh-vault.sh

source ./install-ntp.sh
source ./install-git.sh
source ./install-docker.sh
source ./install-nano.sh
source ./install-zsh.sh

source ./install-fd.sh

if [ -f /vagrant/ubuntu-xenial-16.04-cloudimg-console.log ]; then
    rm /vagrant/ubuntu-xenial-16.04-cloudimg-console.log
fi