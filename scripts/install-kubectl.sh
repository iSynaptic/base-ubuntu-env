#!/bin/bash

set -e

source common.sh

if ! which kubectl > /dev/null; then
    installing "Kubectl"

    curl -sL -o /tmp/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
    install /tmp/kubectl /usr/local/bin/kubectl
    rm /tmp/kubectl
fi