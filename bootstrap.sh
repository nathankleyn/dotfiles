#!/usr/bin/env bash

DOTFILES_ROOT=$(dirname "$0")
cd $DOTFILES_ROOT

xcode-select --install

if [ `which brew` = "brew not found" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap fisherman/tap
brew install fish fisherman graphviz thrift ruby rustup scala sbt direnv
brew cask install atom docker font-hasklig font-source-code-pro font-source-code-pro-for-powerline gpg-suite insomnia iterm2 java8 jetbrains-toolbox typora vlc visual-studio-code visualvm zerotier-one

gem install bundler
rustup-init -y
rustup install beta
rustup install nightly

curl -L https://get.oh-my.fish | fish
fish -c "fisher install edc/bass fzf imgcat ; and __fzf_install"
fish -c "omf install bobthefish"

fish -c "cd $DOTFILES_ROOT; and rake"
./atom/restore-packages.sh
./vscode/restore-extensions.sh

cat /etc/shells | grep -v fish | sudo tee /etc/shells
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
