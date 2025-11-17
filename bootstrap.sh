#!/usr/bin/env bash

set -e

DOTFILES_ROOT="$(dirname "$0")"
cd "$DOTFILES_ROOT"

xcode-select --install || true

# Install Homebrew for ARM64
if [ "$(command -v brew)" = "brew not found" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# FIXME: May no longer be needed, experiment on next laptop move.
# Install Homebrew for x86_64 compat
# if [ ! -f "/usr/local/bin/brew" ]; then
#   arch -x86_64 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# fi

brew bundle
# arch -x86_64 /usr/local/bin/brew bundle --no-lock --file Brewfile-x86

./install-mac-app-store-deps.sh

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
GEM_HOME=~/.gem gem install bundler

rustup-init -y
# shellcheck disable=SC1090
source ~/.cargo/env
rustup install beta
rustup install nightly

curl -L https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > /tmp/oh-my-fish
chmod +x /tmp/oh-my-fish
/tmp/oh-my-fish --path=~/.local/share/omf --config=~/.config/omf
rm /tmp/oh-my-fish
echo "Installed!"

fish -c "fisher install edc/bass PatrickF1/fzf.fish"
fish -c "omf install bobthefish" || true
# Checkout an older version to avoid showing tags on main branches, which is just noisy
(cd $OMF_PATH/themes/bobthefish && git checkout c2c47dc964a257131b3df2a127c2631b4760f3ec)

fish -c "cd $DOTFILES_ROOT; and rake"
./vscode/restore-extensions.sh

grep -v fish /etc/shells | sudo tee /etc/shells
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

echo "All done! ✅"
