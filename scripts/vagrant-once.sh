#!/bin/bash

source "/vagrant/scripts/utils/methods.sh"

info "User: $USER, Run: Once"

# Git
# https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
info "CLAUDEBOX_GIT_USER_NAME: $CLAUDEBOX_GIT_USER_NAME, CLAUDEBOX_GIT_USER_EMAIL: $CLAUDEBOX_GIT_USER_EMAIL"
git config --global user.name "$CLAUDEBOX_GIT_USER_NAME"
git config --global user.email "$CLAUDEBOX_GIT_USER_EMAIL"
info "user.name: $(git config --global user.name), user.email: $(git config --global user.email)"

# Volta
# https://docs.volta.sh/guide/getting-started
info "CLAUDEBOX_NODE_VERSION: $CLAUDEBOX_NODE_VERSION"
curl https://get.volta.sh | bash
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
volta install "node@$CLAUDEBOX_NODE_VERSION"
info "node $(node --version), npm v$(npm --version)"

# Claude Code
# https://docs.anthropic.com/en/docs/claude-code/overview
npm install -g @anthropic-ai/claude-code
info "v$(claude --version)"

# claudebox
echo "cd /vagrant/repositories" >> ~/.bashrc
