#!/bin/bash

source ./common.sh

if ! which curl >> /dev/null; then
    installing "curl"
    apt-get install -y curl
fi