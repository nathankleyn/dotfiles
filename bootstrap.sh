#!/usr/bin/env bash

set -e

DOTFILES_ROOT="$(dirname "$0")"
cd "$DOTFILES_ROOT"

xcode-select --install || true

# Install Homebrew for ARM64
if [ "$(command -v brew)" = "brew not found" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
GEM_HOME=~/.gem gem install bundler

rustup-init -y
# shellcheck disable=SC1090
source ~/.cargo/env
rustup install beta
rustup install nightly

rake

grep -qxF "/opt/homebrew/bin/zsh" /etc/shells || echo "/opt/homebrew/bin/zsh" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/zsh

echo "All done! ✅"
