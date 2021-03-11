#!/bin/bash

source ./common.sh

if ! which vault >> /dev/null; then
    installing "Vault 1.6.3"

    mkdir -p /tmp/vault

    pushd /tmp/vault >> /dev/null
    curl -sL https://releases.hashicorp.com/vault/1.6.3/vault_1.6.3_linux_amd64.zip -o vault.zip

    unzip vault.zip
    install vault /usr/local/bin/vault

    popd >> /dev/null
    rm -rf /tmp/vault
fi