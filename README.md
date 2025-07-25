# claudebox


## Features



## Setup

- Tested Environment
  - macOS 15.5 / Intel Core i5
  - **Not compatible with Apple Silicon**

```shell
# https://www.virtualbox.org/wiki/Downloads
cd ~/Downloads
curl -O https://download.virtualbox.org/virtualbox/7.1.8/VirtualBox-7.1.8-168469-OSX.dmg

# https://developer.hashicorp.com/vagrant/install
brew tap hashicorp/tap
brew install hashicorp/tap/hashicorp-vagrant
```


## Usage

### VM

```shell
# Create
$ CLAUDEBOX_GIT_USER_NAME="claude" \
  CLAUDEBOX_GIT_USER_EMAIL="claude@example.com" \
  CLAUDEBOX_NODE_VERSION="22.17.0" \
  vagrant up --provision

# Start VM
$ vagrant up

# SSH
$ vagrant ssh

# Stop VM
$ vagrant halt

# Destroy VM
$ vagrant halt && vagrant destroy -f && rm -rf .vagrant
```


## Reference

- [Documentation - Vagrant - HashiCorp Developer](https://developer.hashicorp.com/vagrant/docs)
