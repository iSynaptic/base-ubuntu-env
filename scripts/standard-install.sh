#!/bin/bash

source ./common.sh

if [ ! -f /etc/dist-upgraded ]; then
    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
    touch /etc/dist-upgraded
fi

if ! apt list --installed 2>/dev/null | grep software-properties-common > /dev/null 2>&1; then
    installing "Software Properties Common"
    apt-get install -y software-properties-common
fi

if ! apt list --installed 2>/dev/null | grep build-essential > /dev/null 2>&1; then
    installing "Build Essential"
    apt-get install -y software-properties-common build-essential
fi

if ! apt list --installed 2>/dev/null | grep apt-transport-https > /dev/null 2>&1; then
    installing "APT HTTPS support"
    apt-get install -y apt-transport-https
fi

echo -1 > /proc/sys/kernel/perf_event_paranoid

rm -f /etc/resolv.conf
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

source ./install-curl.sh
source ./install-zip-tools.sh
source ./install-jq.sh
source ./install-yq.sh
source ./install-jless.sh
source ./install-yaml2json.sh
source ./install-gron.sh
source ./install-pv.sh
source ./install-ptail.sh
source ./install-jwt.sh

source ./install-gpg2.sh
source ./install-gopass.sh
source ./install-ssh-vault.sh

source ./install-fd.sh
source ./install-sd.sh
source ./install-ripgrep.sh
source ./install-rga.sh
source ./install-exa.sh
source ./install-fzf.sh
source ./install-navi.sh
source ./install-just.sh

source ./install-ntp.sh
source ./install-git.sh
source ./install-docker.sh
source ./install-nano.sh
source ./install-zsh.sh
source ./install-earthly.sh
