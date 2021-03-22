#!/bin/bash

source ./common.sh
(

MINIMUM_GIT_VERSION=2.22.0
EXISTING_GIT_VERSION=$((which git && (git --version | awk '{print $3}')) || echo "0.0.0")

if ! which git >> /dev/null || version_gt $MINIMUM_GIT_VERSION $EXISTING_GIT_VERSION ; then
    installing "Git"

    add-apt-repository ppa:git-core/ppa
    apt-get update

    if which git > /dev/null; then
        apt-get upgrade -y git
    else
        apt-get install -y git
    fi
fi

)

if ! which gitin >> /dev/null; then
    installing "Gitin"
    curl -o /tmp/gitin.tgz -sSL https://github.com/isacikgoz/gitin/releases/download/v0.2.1/gitin_0.2.1_linux_amd64.tar.gz

    (
        cd /tmp
        tar -xf gitin.tgz
    )
    install /tmp/gitin /usr/local/bin/gitin

    rm /tmp/gitin /tmp/gitin.tgz
fi

if ! which hub >> /dev/null; then
    installing "Hub"
    curl -o /tmp/hub.tgz -sSL https://github.com/github/hub/releases/download/v2.12.3/hub-linux-amd64-2.12.3.tgz

    (
        cd /tmp
        tar -xf hub.tgz
    )
    
    install /tmp/hub-linux-amd64-2.12.3/bin/hub /usr/local/bin/hub
    rm -rf /tmp/hub-linux-amd64-2.12.3 /tmp/hub.tgz
fi

if ! which gh >> /dev/null; then
    installing "GitHub CLI"
    curl -o /tmp/gh.tgz -sSL https://github.com/cli/cli/releases/download/v1.7.0/gh_1.7.0_linux_amd64.tar.gz

    (
        mkdir -p /tmp/gh
        cd /tmp/gh
        tar -xf /tmp/gh.tgz
    )
    
    install /tmp/gh/gh_1.7.0_linux_amd64/bin/gh /usr/local/bin/gh
    rm -rf /tmp/gh /tmp/gh.tgz
fi