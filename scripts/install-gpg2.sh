#!/bin/bash

source ./common.sh

if ! which gpg2 >> /dev/null; then
    installing "GPG2"

    sudo apt-get install -y gnupg2
fi
