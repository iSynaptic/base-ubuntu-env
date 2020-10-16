#!/bin/bash

source ./common.sh

if ! which helm > /dev/null; then
    installing "Helm"

    curl -sSL https://baltocdn.com/helm/signing.asc | apt-key add -
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list
    apt-get update
    apt-get install helm
fi