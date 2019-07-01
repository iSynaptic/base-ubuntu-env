#!/bin/bash

source ./common.sh

if ! which jq > /dev/null; then
    installing "JQ 1.6"
    curl -sL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o /tmp/jq
    install /tmp/jq /usr/local/bin/jq
    rm /tmp/jq
fi