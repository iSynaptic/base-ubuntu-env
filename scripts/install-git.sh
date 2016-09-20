#!/bin/bash

source ./common.sh

if (! which git >> /dev/null) || [ "$(git --version)" == "git version 2.5.0" ]; then
    installing "Git"

    add-apt-repository ppa:git-core/ppa
    apt-get update
    apt-get install -y git
fi