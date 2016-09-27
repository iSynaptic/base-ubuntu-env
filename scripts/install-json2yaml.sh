#!/bin/bash

source ./common.sh

if ! which json2yaml > /dev/null; then
    installing "Json2Yaml"
    curl -sL https://github.com/iSynaptic/json2yaml/raw/master/builds/linux_amd64/json2yaml -o /tmp/j2y
    install /tmp/j2y /usr/local/bin/json2yaml
    rm /tmp/j2y
fi