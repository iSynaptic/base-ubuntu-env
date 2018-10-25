#!/bin/bash

source ./common.sh
(

MINIMUM_GIT_VERSION=2.19.1
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