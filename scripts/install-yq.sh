#!/bin/bash

source ./common.sh

if ! which yq > /dev/null; then
    installing "YQ 4.27.5"
    curl -sSL0 https://github.com/mikefarah/yq/releases/download/v4.27.5/yq_linux_amd64 -o /tmp/yq
    install /tmp/yq /usr/local/bin/yq
    rm /tmp/yq
fi