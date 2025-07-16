#!/bin/bash

source "/vagrant/scripts/utils/methods.sh"

info "User: $USER, Run: Once"

# Git
# https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
git config --global user.name "$CLAUDEBOX_GIT_USER_NAME"
git config --global user.email "$CLAUDEBOX_GIT_USER_EMAIL"

# Volta
# https://docs.volta.sh/guide/getting-started
curl https://get.volta.sh | bash
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
volta install "node@$CLAUDEBOX_NODE_VERSION"

# Claude Code
# https://docs.anthropic.com/en/docs/claude-code/overview
npm install -g @anthropic-ai/claude-code

# claudebox
echo "cd /vagrant/repositories" >> ~/.bashrc
