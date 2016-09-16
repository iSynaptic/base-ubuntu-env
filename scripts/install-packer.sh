#!/bin/bash

source ./common.sh

if ! which packer > /dev/null; then
    installing "Packer"

    pushd /tmp >> /dev/null

    curl -s https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip -o packer.zip
    unzip packer.zip
    install packer /usr/local/bin/packer
    
    rm packer
    rm packer.zip

    popd >> /dev/null
fi