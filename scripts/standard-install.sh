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
    installing "APT HTTPS support"
    apt-get install -y apt-transport-https
fi

# if ! (cat /etc/resolvconf/resolv.conf.d/head 2> /dev/null || echo "") | grep "nameserver 1.1.1.1" > /dev/null 2>&1; then
#     mkdir -p /etc/resolvconf/resolv.conf.d

#     cat >> /etc/resolvconf/resolv.conf.d/head <<EOF

# nameserver 1.1.1.1
# nameserver 1.0.0.1
# nameserver 8.8.8.8
# nameserver 8.8.4.4
# EOF

# fi

# if ! apt list --installed 2>/dev/null | grep resolvconf > /dev/null 2>&1; then
#     installing "Resolvconf Package"
#     apt install -y resolvconf

#     service resolvconf start
# fi

# resolvconf -u

rm -f /etc/resolv.conf
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

source ./install-curl.sh
source ./install-zip-tools.sh
source ./install-jq.sh
source ./install-gron.sh
source ./install-pv.sh

source ./install-gpg2.sh
source ./install-gopass.sh
source ./install-ssh-vault.sh

source ./install-ntp.sh
source ./install-git.sh
source ./install-docker.sh
source ./install-nano.sh
source ./install-zsh.sh

source ./install-fd.sh
source ./install-ripgrep.sh
source ./install-exa.sh

#if [ -f /vagrant/ubuntu-xenial-16.04-cloudimg-console.log ]; then
#    rm /vagrant/ubuntu-xenial-16.04-cloudimg-console.log
#fi