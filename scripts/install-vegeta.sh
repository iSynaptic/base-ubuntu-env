#!/bin/bash

source ./common.sh

if ! which vegeta > /dev/null; then
    installing "Vegeta 12.5.1"

    curl -o /tmp/vegeta.tar.gz -sL https://github.com/tsenart/vegeta/releases/download/cli%2Fv12.5.1/vegeta-12.5.1-linux-amd64.tar.gz
    (cd /tmp && tar -vxzf /tmp/vegeta.tar.gz > /dev/null)
    install /tmp/vegeta /usr/local/bin/vegeta
    rm /tmp/vegeta.tar.gz /tmp/vegeta
fi