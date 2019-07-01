#!/bin/bash

source ./common.sh

if ! which fly >> /dev/null; then
    installing "Concourse Fly 5.3.0"
    curl -o /tmp/fly.tgz -sSL https://github.com/concourse/concourse/releases/download/v5.3.0/fly-5.3.0-linux-amd64.tgz

    (
        cd /tmp
        tar -xf fly.tgz
    )

    install /tmp/fly /usr/local/bin/fly

    rm /tmp/fly
    rm /tmp/fly.tgz
fi