#!/bin/bash

source ./common.sh

if ! which gron >> /dev/null; then
    installing "Gron"
    curl -o /tmp/gron.tgz -sSL https://github.com/tomnomnom/gron/releases/download/v0.5.1/gron-linux-amd64-0.5.1.tgz

    (
        cd /tmp
        tar -xf gron.tgz
    )
    install /tmp/gron /usr/local/bin/gron

    rm /tmp/gron /tmp/gron.tgz
fi