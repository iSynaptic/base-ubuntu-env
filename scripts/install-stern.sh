#!/bin/bash

source ./common.sh

if ! which stern > /dev/null; then
    installing "Stern 1.5"
    curl -sL https://github.com/wercker/stern/releases/download/1.6.0/stern_linux_amd64 -o /tmp/stern
    install /tmp/stern /usr/local/bin/stern
    rm /tmp/stern
fi