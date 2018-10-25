#!/bin/bash

source ./common.sh

if ! which ssh-vault > /dev/null; then
    installing "SSH-Vault"

    curl -sL https://bintray.com/nbari/ssh-vault/download_file?file_path=ssh-vault_0.12.4_linux_amd64.tar.gz -o /tmp/ssh-vault.tar.gz
    (
        cd /tmp
        tar -vxzf /tmp/ssh-vault.tar.gz
    )

    install /tmp/ssh-vault_0.12.4_linux_amd64/ssh-vault /usr/local/bin/ssh-vault
    rm -rf /tmp/ssh-vault_0.12.4_linux_amd64
    rm /tmp/ssh-vault.tar.gz
fi