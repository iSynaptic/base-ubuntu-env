#!/bin/bash

source ./common.sh

if [ ! -d ~/.nvm ]; then
    installing "NVM"

    # use insecure installer
    # (by default, nvm installer sources nvm in the .bashrc file. this does not
    # support login shells, as is used by web-build-all.sh. so, intercept the
    # sourcing code and apply it to both .bashrc and .profile)
    PROFILE=~/.nvmprofile
    echo "" >"$PROFILE"
    sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | sudo bash || exit 1
    command grep -qFc '/nvm.sh' ~/.profile || sudo cat "$PROFILE" >>~/.profile
    command grep -qFc '/nvm.sh' ~/.bashrc || sudo cat "$PROFILE" >>~/.bashrc
    rm "$PROFILE"

    # life will be better if the npm cache is stored on the host
    echo "cache=/host/.npm" >>~/.npmrc
fi