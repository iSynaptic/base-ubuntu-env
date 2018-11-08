#!/bin/bash

source ./common.sh

if ! which bat >> /dev/null; then
    installing "bat"

    curl -sSL https://github.com/sharkdp/bat/releases/download/v0.8.0/bat_0.8.0_amd64.deb -o /tmp/bat.deb
    dpkg -i /tmp/bat.deb

    rm /tmp/bat.deb
fi
