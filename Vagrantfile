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
  config.vm.provision "shell", run: "always", inline: <<-SHELL
    apt-get update
    apt-get install -y git vim

    apt-get autoremove -y
    apt-get clean
  SHELL
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    # Git
    # https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
    git config --global user.name "#{ENV['CLAUDEBOX_GIT_USER_NAME']}"
    git config --global user.email "#{ENV['CLAUDEBOX_GIT_USER_EMAIL']}"
  SHELL
end
