#!/bin/bash

source ./common.sh

if ! which terraform >> /dev/null; then
    installing "Terraform"

    mkdir -p /tmp/terraform

    pushd /tmp/terraform >> /dev/null
    curl -sL https://releases.hashicorp.com/terraform/0.7.3/terraform_0.7.3_linux_amd64.zip -o terraform.zip

    unzip terraform.zip
    install terraform /usr/local/bin/terraform

    popd >> /dev/null
    rm -rf /tmp/terraform
fi