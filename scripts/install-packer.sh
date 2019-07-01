#!/bin/bash

source ./common.sh

if ! which packer > /dev/null; then
    installing "Packer"

    pushd /tmp >> /dev/null

    curl -sSL https://releases.hashicorp.com/packer/1.4.2/packer_1.4.2_linux_amd64.zip -o packer.zip
    unzip packer.zip
    install packer /usr/local/bin/packer
    
    rm packer
    rm packer.zip

    popd >> /dev/null
fi