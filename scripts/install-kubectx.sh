#!/bin/bash

set -e

source common.sh

if ! which kubectx > /dev/null; then
    installing "Kubectx"

    curl -sL -o /tmp/kubectx.tar.gz -LO https://github.com/FGRibreau/kubectx-rs/releases/download/v1.0.3/kubectx-v1.0.3-x86_64-unknown-linux-gnu.tar.gz
    (cd /tmp && tar -xf /tmp/kubectx.tar.gz)
    install /tmp/kubectx /usr/local/bin/kubectx
    rm /tmp/kubectx /tmp/kubectx.tar.gz
fi