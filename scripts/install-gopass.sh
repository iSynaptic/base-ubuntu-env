#!/bin/bash

source ./common.sh

if ! which gopass >> /dev/null; then
    installing "Gopass"

    curl -sSL https://github.com/justwatchcom/gopass/releases/download/v1.8.5/gopass-1.8.5-linux-amd64.deb -o /tmp/gopass.deb
    dpkg -i /tmp/gopass.deb

    rm /tmp/gopass.deb
fi
