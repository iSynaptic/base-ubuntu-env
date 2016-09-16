#!/bin/bash

source ./common.sh

if ! which javac > /dev/null; then
    installing "Java"

    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

    add-apt-repository ppa:webupd8team/java
    apt-get update
    apt-get install -y oracle-java8-installer
fi