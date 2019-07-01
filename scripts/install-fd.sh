#!/bin/bash

source ./common.sh

if ! which fd >> /dev/null; then
    installing "fd"

    curl -sSL https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb -o /tmp/fd.deb
    dpkg -i /tmp/fd.deb

    rm /tmp/fd.deb
fi
