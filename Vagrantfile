# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # https://portal.cloud.hashicorp.com/vagrant/discover/bento/ubuntu-24.04
  config.vm.box = "bento/ubuntu-24.04"
  config.vm.box_version = "202502.21.0"

  # https://developer.hashicorp.com/vagrant/docs/providers/virtualbox/configuration
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 2048
  end

  # SSH
  # https://developer.hashicorp.com/vagrant/docs/vagrantfile/ssh_settings
  config.ssh.key_type = :ed25519

  # Provisioning
  # https://developer.hashicorp.com/vagrant/docs/provisioning
  env = {
    CLAUDEBOX_GIT_USER_NAME: ENV['CLAUDEBOX_GIT_USER_NAME'],
    CLAUDEBOX_GIT_USER_EMAIL: ENV['CLAUDEBOX_GIT_USER_EMAIL'],
    CLAUDEBOX_NODE_VERSION: ENV['CLAUDEBOX_NODE_VERSION'],
  }
  config.vm.provision "shell", path: "./scripts/root-once.sh"
  config.vm.provision "shell", run: "always", path: "./scripts/root-always.sh"
  config.vm.provision "shell", privileged: false, path: "./scripts/vagrant-once.sh", env: env
  config.vm.provision "shell", privileged: false, run: "always", path: "./scripts/vagrant-always.sh"
end
