#!/bin/bash

source ./common.sh

if ! which node >> /dev/null; then
    installing "Node"

    curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi