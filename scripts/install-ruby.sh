#!/bin/bash

source ./common.sh

if ! which irb >> /dev/null; then
    installing "Ruby & Development Dependencies"
    
    sudo apt-add-repository ppa:brightbox/ruby-ng
    sudo apt-get update

    sudo apt-get install -y ruby2.3 ruby2.3-dev build-essential libpq-dev
    sudo gem install pg -v '0.19.0'
    sudo gem install ruby-debug-ide -v '0.6.0'
    sudo gem install bundler
fi