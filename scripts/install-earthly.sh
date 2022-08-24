#!/bin/bash

source ./common.sh

EARTHLY_VERSION="0.6.22"

if ! which earthly > /dev/null; then
    installing "Earthly v$EARTHLY_VERSION"
    curl -sL https://github.com/earthly/earthly/releases/download/v$EARTHLY_VERSION/earthly-linux-amd64 -o /tmp/earthly
    install /tmp/earthly /usr/local/bin/earthly
    rm /tmp/earthly
fi