#!/bin/bash

source ./common.sh

if ! which vegeta > /dev/null; then
    installing "Vegeta 6.3.0"

    curl -o /tmp/vegeta.tar.gz -sL https://github.com/tsenart/vegeta/releases/download/v6.3.0/vegeta-v6.3.0-linux-amd64.tar.gz
    (cd /tmp && tar -vxzf /tmp/vegeta.tar.gz > /dev/null)
    install /tmp/vegeta /usr/local/bin/vegeta
    rm /tmp/vegeta.tar.gz /tmp/vegeta
fi