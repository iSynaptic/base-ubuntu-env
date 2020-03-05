#!/bin/bash

source ./common.sh

if ! which nodejs >> /dev/null; then
    installing "Node"

    curl -sL https://deb.nodesource.com/setup_12.x -o /tmp/nodesetup.sh

    chmod +x /tmp/nodesetup.sh
    sudo /tmp/nodesetup.sh
    rm /tmp/nodesetup.sh

    sudo apt-get install -y nodejs
fi