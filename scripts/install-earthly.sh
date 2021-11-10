#!/bin/bash

source ./common.sh

if ! which earthly > /dev/null; then
    installing "Earthly v0.5.24"
    curl -sL https://github.com/earthly/earthly/releases/download/v0.5.24/earthly-linux-amd64 -o /tmp/earthly
    install /tmp/earthly /usr/local/bin/earthly
    rm /tmp/earthly
fi