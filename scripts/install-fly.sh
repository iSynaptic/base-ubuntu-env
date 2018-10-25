#!/bin/bash

source ./common.sh

if ! which fly >> /dev/null; then
    installing "Concourse Fly 4.2.1"
    curl -o /tmp/fly -sSL https://github.com/concourse/concourse/releases/download/v4.2.1/fly_linux_amd64

    install /tmp/fly /usr/local/bin/fly

    rm /tmp/fly
fi