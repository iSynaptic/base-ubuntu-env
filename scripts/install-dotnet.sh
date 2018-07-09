#!/bin/bash

source ./common.sh

if ! which dotnet > /dev/null; then
    installing ".NET 2.1.4"
    
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'

    apt-get update
    apt-get install -y dotnet-sdk-2.1.4
fi