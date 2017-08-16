#!/usr/bin/env bash
xcode-select --install

if [ `which brew` = "brew not found" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap fisherman/tap
brew cask install atom docker font-hasklig font-source-code-pro gpgtools iterm2 java jetbrains-toolbox screenhero typora vlc zerotier-one
brew install fish fisherman graphviz thrift ruby rustup scala sbt direnv
gem install bundler
rustup-init -y
rustup install beta
rustup install nightly
fish -c "fisher install edc/bass fzf imgcat teapot; and __fzf_install"

cat /etc/shells | grep -v fish | sudo tee /etc/shells
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
