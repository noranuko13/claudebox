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
  config.vm.provision "shell", run: "always", privileged: false, inline: <<-SHELL
    # Git
    # https://git-scm.com/docs/gitignore
    mkdir -p $HOME/.config/git
    cp /vagrant/provision/.config/git/ignore $HOME/.config/git/ignore
    chown -R vagrant:vagrant $HOME/.config/git/ignore

    # Claude Code
    # https://docs.anthropic.com/en/docs/claude-code/settings
    mkdir -p $HOME/.claude
    cp /vagrant/provision/.claude/settings.json $HOME/.claude/settings.json
    chown -R vagrant:vagrant $HOME/.claude/settings.json
  SHELL
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    # Git
    # https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
    git config --global user.name "#{ENV['CLAUDEBOX_GIT_USER_NAME']}"
    git config --global user.email "#{ENV['CLAUDEBOX_GIT_USER_EMAIL']}"

    # Volta
    # https://docs.volta.sh/guide/getting-started
    curl https://get.volta.sh | bash
    export VOLTA_HOME="$HOME/.volta"
    export PATH="$VOLTA_HOME/bin:$PATH"
    volta install "node@#{ENV['CLAUDEBOX_NODE_VERSION']}"

    # Claude Code
    # https://docs.anthropic.com/en/docs/claude-code/overview
    npm install -g @anthropic-ai/claude-code

    # claudebox
    echo "cd /vagrant/repositories" >> ~/.bashrc
  SHELL
end
