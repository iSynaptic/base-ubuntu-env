#!/bin/bash

source ./common.sh

if ! which dotnet > /dev/null; then
    installing ".NET 2.2.4"
    
    curl -o /tmp/packages-microsoft-prod.deb -sSL https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

    dpkg -i /tmp/packages-microsoft-prod.deb
    rm /tmp/packages-microsoft-prod.deb

    apt-get update
    apt-get install -y dotnet-sdk-2.2
fi