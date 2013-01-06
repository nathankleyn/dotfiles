#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. /usr/share/git/completion/git-completion.bash
. $HOME/repos/gd/bieber/bin/bieber-completion

export BROWSER=chromium
export EDITOR=vim
export LANG=en_US.UTF-8

# Add RBEnv, common build scripts for Java, bieber and cabal to the PATH.
export PATH=$HOME/.rbenv/bin:$HOME/repos/gd/social-business-engine/common/scripts:$HOME/repos/gd/bieber/bin/shims:$HOME/.cabal/bin:$PATH

# Enable RBEnv.
eval "$(rbenv init - --no-rehash)"

shopt -s globstar
shopt -s extglob

alias r="reset"
alias l="ll"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias rspec="rspec -c -b"
alias rep="cd ~/repos"
alias sc="cd ~/repos/scripts"
alias gd="cd ~/repos/gd"
alias gs="git status"
alias bieb="gd && cd bieber"
alias open="xdg-open"

# Pretty prompt with colours.

colour_reset='\e[m'
colour_blue='\e[0;34m'
colour_cyan='\e[0;36m'
colour_red='\e[0;31m'

PS1="$colour_cyan\w $colour_blue)$colour_reset "
