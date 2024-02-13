#!/bin/bash

source ./common.sh

if ! which ssh-vault > /dev/null; then
    installing "SSH-Vault"

    curl -sSL https://github.com/ssh-vault/ssh-vault/releases/download/0.12.10/ssh-vault-0.12.10-linux-amd64.tar.gz -o /tmp/ssh-vault.tar.gz
    (
        cd /tmp
        tar -vxzf /tmp/ssh-vault.tar.gz
    )

    install /tmp/ssh-vault /usr/local/bin/ssh-vault
    rm -rf /tmp/ssh-vault
    rm /tmp/ssh-vault.tar.gz
fi