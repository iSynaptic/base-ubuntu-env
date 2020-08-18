#!/bin/bash

source ./common.sh

if ! which node >> /dev/null; then
    installing "Node"

    curl -sL https://deb.nodesource.com/setup_14.x -o /tmp/nodesetup.sh

    chmod +x /tmp/nodesetup.sh
    sudo /tmp/nodesetup.sh
    rm /tmp/nodesetup.sh

    sudo apt-get install -y nodejs
fi