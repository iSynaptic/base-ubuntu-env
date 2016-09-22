#!/bin/bash

source ./common.sh

if ! which rvm >> /dev/null; then
    installing "RMV"

    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    sudo curl -sSL https://get.rvm.io | sudo bash -s stable --ruby
    sudo gem install bundler
fi