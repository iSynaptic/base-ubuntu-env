#!/bin/bash

source ./common.sh

mkdir -p /etc/fzf/shell

if [ ! -f /etc/fzf/fzf ]; then
    installing "Fzf"
    curl -o /tmp/fzf.tgz -sSL https://github.com/junegunn/fzf/releases/download/0.28.0/fzf-0.28.0-linux_amd64.tar.gz

    (
        cd /tmp
        tar -xf fzf.tgz
    )
    install /tmp/fzf /etc/fzf/fzf

    rm /tmp/fzf /tmp/fzf.tgz
fi

if [ ! -f /etc/fzf/shell/completion.zsh ]; then
    installing "Fzf Completions Script"
    curl -o /etc/fzf/shell/completion.zsh -sSL https://raw.githubusercontent.com/junegunn/fzf/0.28.0/shell/completion.zsh
fi

if [ ! -f /etc/fzf/shell/key-bindings.zsh ]; then
    installing "Fzf Key Bindings"
    curl -o /etc/fzf/shell/key-bindings.zsh -sSL https://raw.githubusercontent.com/junegunn/fzf/0.28.0/shell/key-bindings.zsh
fi