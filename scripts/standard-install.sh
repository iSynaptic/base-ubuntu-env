#!/bin/bash

source ./common.sh

if [ ! -f /etc/init.d/ntp ]; then
    installing "NTP"

    apt-get install -y ntp
    /etc/init.d/ntp start
fi

if [ "$(git --version)" = "git version 2.5.0" ]; then
    installing "Git"

    add-apt-repository ppa:git-core/ppa
    apt-get update
    apt-get install -y git
fi

if ! which jq > /dev/null; then
    installing "JQ 1.5"
    curl -sL https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -o /tmp/jq
    install /tmp/jq /usr/local/bin/jq
    rm /tmp/jq
fi

if ! which docker > /dev/null; then
    installing "Docker"

    curl -sSL https://get.docker.com | sh

    gpasswd -a vagrant docker
fi

if ! which docker-compose > /dev/null; then
    installing "Docker Compose"

    curl -sL https://github.com/docker/compose/releases/download/1.8.0/docker-compose-Linux-x86_64 -o /tmp/dc
    install /tmp/dc /usr/local/bin/docker-compose
    rm /tmp/dc
fi

if ! which nano > /dev/null; then
    apt-get install -y nano
fi

if ! which zsh > /dev/null; then
    installing "Z-Shell"
    apt-get install -y zsh

    if [ -f /bin/zsh ]; then
    chsh -s /bin/zsh vagrant
    fi
fi

if [ ! -d ~/.oh-my-zsh ]; then
    installing "Oh My Zsh"

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo cp -rf /root/.oh-my-zsh /home/vagrant/.oh-my-zsh
fi

if [ ! -f /home/vagrant/.zshrc ]; then
    installing "Z-Shell profile hook"
    
    echo "source ~/zshrc.stock" >> /home/vagrant/.zshrc
    echo "source ~/zshrc.stock" >> /root/.zshrc
fi

if [ ! -f /home/vagrant/zshrc.stock ]; then
    installing "stock Z-Shell profile"
    cp /vagrant/zshrc /home/vagrant/zshrc.stock
    cp /vagrant/zshrc /root/zshrc.stock
fi

if [ -f /vagrant/zshrc.user ] && [ ! -f /home/vagrant/zshrc.user ]; then
    installing "custom Z-Shell profile"
    cp /vagrant/zshrc.user /home/vagrant/zshrc.user
    cp /vagrant/zshrc.user /root/zshrc.user
fi

SOURCE_PROFILE_HASH=($(md5sum /vagrant/zshrc))
LOCAL_PROFILE_HASH=($(md5sum /home/vagrant/zshrc.stock))

if [ ! "$LOCAL_PROFILE_HASH" = "$SOURCE_PROFILE_HASH" ]; then
    installing "updated stock Z-Shell profile"
    rm /home/vagrant/zshrc.stock
    rm /root/zshrc.stock

    cp /vagrant/zshrc /home/vagrant/zshrc.stock
    cp /vagrant/zshrc /root/zshrc.stock
fi

if [ -f /vagrant/zshrc.user ]; then
    SOURCE_CUSTOM_PROFILE_HASH=($(md5sum /vagrant/zshrc.user))
    LOCAL_CUSTOM_PROFILE_HASH=($(md5sum /home/vagrant/zshrc.user))

    if [ ! "$LOCAL_CUSTOM_PROFILE_HASH" = "$SOURCE_CUSTOM_PROFILE_HASH" ]; then
        installing "updated custom Z-Shell profile"
        rm /home/vagrant/zshrc.user
        rm /root/zshrc.user

        cp /vagrant/zshrc.user /home/vagrant/zshrc.user
        cp /vagrant/zshrc.user /root/zshrc.user
    fi
fi

if [ -f /vagrant/ubuntu-xenial-16.04-cloudimg-console.log ]; then
    rm /vagrant/ubuntu-xenial-16.04-cloudimg-console.log
fi