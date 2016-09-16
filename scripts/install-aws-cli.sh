#!/bin/bash

source ./common.sh

if ! which aws > /dev/null; then
    installing "AWS CLI"

    mkdir -p /tmp/aws
    pushd /tmp/aws >> /dev/null
    
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
    unzip awscli-bundle.zip
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

    popd >> /dev/null

    rm -rf /tmp/aws
fi