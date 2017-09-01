#!/bin/bash

source ./common.sh

if ! which fly >> /dev/null; then
    installing "Concourse Fly 3.4.1"
    curl -o /tmp/fly -sSL https://github.com/concourse/concourse/releases/download/v3.4.1/fly_linux_amd64

    install /tmp/fly /usr/local/bin/fly

    rm /tmp/fly
fi