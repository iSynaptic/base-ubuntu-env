#!/bin/bash

source ./common.sh

if ! which exa > /dev/null; then
    installing "Exa"
    curl -o /tmp/exa.zip -sSL https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip

    (cd /tmp && unzip exa.zip)
    install /tmp/exa-linux-x86_64 /usr/local/bin/exa
    rm /tmp/exa.zip /tmp/exa-linux-x86_64
fi