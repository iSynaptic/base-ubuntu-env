#!/bin/bash

source ./common.sh
(

function version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }

MINIMUM_GIT_VERSION=2.9.3
EXISTING_GIT_VERSION=$(git --version | awk '{print $3}' || 0.0.0)

if (! which git >> /dev/null) || version_gt $MINIMUM_GIT_VERSION $EXISTING_GIT_VERSION ; then
    installing "Git"

    add-apt-repository ppa:git-core/ppa
    apt-get update
    apt-get install -y git
fi

)