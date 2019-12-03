#!/usr/bin/env bash

set -e

DOTFILES_ROOT=$(dirname "$0")
cd "$DOTFILES_ROOT"

xcode-select --install || true

if [ "$(command -v brew)" = "brew not found" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

GEM_HOME=~/.gem gem install bundler

rustup-init -y
source $HOME/.cargo/env
rustup install beta
rustup install nightly

curl -L https://get.oh-my.fish | fish
fish -c "fisher add edc/bass fzf imgcat"
fish -c "omf install bobthefish"

fish -c "cd $DOTFILES_ROOT; and rake"
./vscode/restore-extensions.sh

cat /etc/shells | grep -v fish | sudo tee /etc/shells
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
