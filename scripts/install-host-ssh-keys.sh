#!/bin/bash

source ./common.sh


if [ ! -f ~/.ssh/id_rsa ]; then
    installing "Host SSH private key"
    
    cp /host/ssh/id_rsa ~/.ssh/id_rsa
fi

if [ ! -f ~/.ssh/id_rsa.pub ]; then
    installing "Host SSH public key"
    
    cp /host/ssh/id_rsa.pub ~/.ssh/id_rsa.pub
fi

SOURCE_PRI_HASH=($(md5sum ~/.ssh/id_rsa))
LOCAL_PRI_HASH=($(md5sum /host/ssh/id_rsa))

if [ ! "$LOCAL_PRI_HASH" = "$SOURCE_PRI_HASH" ]; then
    installing "updated host SSH private key"
    
    rm ~/.ssh/id_rsa
    cp /host/ssh/id_rsa ~/.ssh/id_rsa
fi

SOURCE_PUB_HASH=($(md5sum ~/.ssh/id_rsa.pub))
LOCAL_PUB_HASH=($(md5sum /host/ssh/id_rsa.pub))

if [ ! "$LOCAL_PUB_HASH" = "$SOURCE_PUB_HASH" ]; then
    installing "updated host SSH public key"
    
    rm ~/.ssh/id_rsa.pub
    cp /host/ssh/id_rsa ~/.ssh/id_rsa.pub
fi

if [[ "$(stat -c "%a" ~/.ssh/id_rsa)" != "600" || "$(stat -c "%a" ~/.ssh/id_rsa.pub)" != "600" ]]; then
    configuring "SSH key file permissions"
    chmod 600 ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa.pub
fi