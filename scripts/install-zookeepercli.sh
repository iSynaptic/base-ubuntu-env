#!/bin/bash

source ./common.sh

if ! which zookeepercli >> /dev/null; then
    installing "zookeepercli"

    curl -sSL https://github.com/outbrain/zookeepercli/releases/download/v1.0.12/zookeepercli_1.0.12_amd64.deb -o /tmp/zkcli.deb
    dpkg -i /tmp/zkcli.deb

    rm /tmp/zkcli.deb
fi
