#!/bin/bash

source ./common.sh

if ! which gopass >> /dev/null; then
    installing "Gopass"

    curl -sL https://www.justwatch.com/gopass/releases/1.1.0/gopass_1.1.0_amd64.deb -o /tmp/gopass.deb
    dpkg -i /tmp/gopass.deb

    rm /tmp/gopass.deb
fi