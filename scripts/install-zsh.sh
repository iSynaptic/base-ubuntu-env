#!/bin/bash

source ./common.sh

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
    sudo chown -R vagrant:vagrant /home/vagrant/.oh-my-zsh
fi

if [ ! -f ~/.oh-my-zsh/themes/bullet-train.zsh-theme ]; then
    installing "Bullet Train ZSH Theme"

    curl -o ~/.oh-my-zsh/themes/bullet-train.zsh-theme -sSL http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme
    sudo cp ~/.oh-my-zsh/themes/bullet-train.zsh-theme /home/vagrant/.oh-my-zsh/themes/
    sudo chown -R vagrant:vagrant /home/vagrant/.oh-my-zsh
fi

if [ ! -f /home/vagrant/.zshrc ]; then
    installing "Z-Shell profile hook"
    
    echo "source ~/.zshrc.stock" >> /home/vagrant/.zshrc
    echo "source ~/.zshrc.stock" >> /root/.zshrc
fi

if [ ! -f /home/vagrant/.zshrc.stock ]; then
    installing "stock Z-Shell profile"
    cp /vagrant/zshrc /home/vagrant/.zshrc.stock
    cp /vagrant/zshrc /root/.zshrc.stock
fi

if [ -f /vagrant/zshrc.user ] && [ ! -f /home/vagrant/.zshrc.user ]; then
    installing "custom Z-Shell profile"
    cp /vagrant/zshrc.user /home/vagrant/.zshrc.user
    cp /vagrant/zshrc.user /root/.zshrc.user
fi

SOURCE_PROFILE_HASH=($(md5sum /vagrant/zshrc))
LOCAL_PROFILE_HASH=($(md5sum /home/vagrant/.zshrc.stock))

if [ ! "$LOCAL_PROFILE_HASH" = "$SOURCE_PROFILE_HASH" ]; then
    installing "updated stock Z-Shell profile"
    rm /home/vagrant/.zshrc.stock
    rm /root/.zshrc.stock

    cp /vagrant/zshrc /home/vagrant/.zshrc.stock
    cp /vagrant/zshrc /root/.zshrc.stock
fi

if [ -f /vagrant/zshrc.user ]; then
    SOURCE_CUSTOM_PROFILE_HASH=($(md5sum /vagrant/zshrc.user))
    LOCAL_CUSTOM_PROFILE_HASH=($(md5sum /home/vagrant/.zshrc.user))

    if [ ! "$LOCAL_CUSTOM_PROFILE_HASH" = "$SOURCE_CUSTOM_PROFILE_HASH" ]; then
        installing "updated custom Z-Shell profile"
        rm /home/vagrant/.zshrc.user
        rm /root/.zshrc.user

        cp /vagrant/zshrc.user /home/vagrant/.zshrc.user
        cp /vagrant/zshrc.user /root/.zshrc.user
    fi
fi