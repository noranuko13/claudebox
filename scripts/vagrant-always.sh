#!/bin/bash

source "/vagrant/scripts/utils/methods.sh"

info "User: $USER, Run: Always"

# Git
# https://git-scm.com/docs/gitignore
mkdir -p "$HOME/.config/git"
cp /vagrant/provision/.config/git/ignore "$HOME/.config/git/ignore"
chown -R vagrant:vagrant "$HOME/.config/git/ignore"

# Claude Code
# https://docs.anthropic.com/en/docs/claude-code/settings
mkdir -p "$HOME/.claude"
cp /vagrant/provision/.claude/settings.json "$HOME/.claude/settings.json"
chown -R vagrant:vagrant "$HOME/.claude/settings.json"
