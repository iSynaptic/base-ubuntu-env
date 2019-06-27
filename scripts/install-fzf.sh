#!/bin/bash

source ./common.sh

if ! which fzf >> /dev/null; then
    installing "Fzf"
    curl -o /tmp/fzf.tgz -sSL https://github.com/junegunn/fzf-bin/releases/download/0.18.0/fzf-0.18.0-linux_amd64.tgz

    (
        cd /tmp
        tar -xf fzf.tgz
    )
    install /tmp/fzf /usr/local/bin/fzf

    rm /tmp/fzf /tmp/fzf.tgz
fi

mkdir -p /etc/fzf/shell

if [ ! -f /etc/fzf/shell/completion.zsh ]; then
    installing "Fzf Completions Script"
    curl -o /etc/fzf/shell/completion.zsh -sSL https://github.com/junegunn/fzf/raw/ff951341c993ed84ad65344e496e122ee3dddf67/shell/completion.zsh
fi

if [ ! -f /etc/fzf/shell/key-bindings.zsh ]; then
    installing "Fzf Key Bindings"
    curl -o /etc/fzf/shell/key-bindings.zsh -sSL https://github.com/junegunn/fzf/raw/ff951341c993ed84ad65344e496e122ee3dddf67/shell/key-bindings.zsh
fi