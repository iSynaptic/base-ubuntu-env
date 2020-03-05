#!/bin/bash

set -e

source common.sh

if ! which kubectl > /dev/null; then
    installing "Kubectl 1.15.0"

    curl -sL -o /tmp/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.3/bin/linux/amd64/kubectl
    install /tmp/kubectl /usr/local/bin/kubectl
    rm /tmp/kubectl
fi