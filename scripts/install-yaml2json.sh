#!/bin/bash

source ./common.sh

if ! which yaml2json > /dev/null; then
    installing "Yaml2Json"
    curl -sL https://github.com/bronze1man/yaml2json/releases/download/v1.2/yaml2json_linux_amd64 -o /tmp/y2j
    install /tmp/y2j /usr/local/bin/yaml2json
    rm /tmp/y2j
fi