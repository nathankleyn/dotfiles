#!/usr/bin/env bash
xcode-select --install

if [ `which brew` = "brew not found" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

brew tap caskroom/cask
brew cask install atom java
brew install thrift scala sbt direnv
