#!/bin/bash

source ./common.sh

if ! which gcloud > /dev/null; then
    installing "Google Cloud SDK"
    sudo snap install google-cloud-sdk --classic
fi