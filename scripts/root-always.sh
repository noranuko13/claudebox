#!/bin/bash

source "/vagrant/scripts/utils/methods.sh"

info "User: $USER, Run: Always"

# Ubuntu
apt-get update

apt-get autoremove -y
apt-get clean
