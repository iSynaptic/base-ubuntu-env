#!/bin/bash

source ./common.sh

if ! which yaml2json > /dev/null; then
    installing "Yaml2Json"
    curl -sL https://github.com/bronze1man/yaml2json/raw/master/builds/linux_amd64/yaml2json -o /tmp/y2j
    install /tmp/y2j /usr/local/bin/yaml2json
    rm /tmp/y2j
fi