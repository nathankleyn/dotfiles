#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/git/completion/git-completion.bash

export BROWSER=chromium
export EDITOR=vim
export JRUBY_OPTS="--1.9 -Xcext.enabled=true"
export RBXOPT=-X19

# Add RBEnv to PATH and enable.
export PATH=$HOME/Scripts/rbenv/bin:$PATH
eval "$(rbenv init -)"

shopt -s globstar
shopt -s extglob

alias r="reset"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"

alias rspec="rspec -c -b"

alias gd="cd ~/GlobalDawn"
alias gs="git status"
alias vm="gd && cd platform-vm"
alias rf="gd && cd platform-ruby-frontend"
alias fe="gd && cd platform-js-frontend"
alias sb="gd && cd platform-js-spacebuilder"
alias bo="gd && cd platform-js-backoffice"
alias vmup="vm && vagrant up && vagrant ssh"
alias open="xdg-open"

function set_title {
  PROMPT_COMMAND='echo -ne "\033]0;'$1'\007"'
}

# Setup SSH agent to store temporary passphrase.

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initialising new SSH Agent session..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi

complete -cf sudo

# Pretty prompt with colours.

colour_reset='\e[m'
colour_blue='\e[0;34m'
colour_cyan='\e[0;36m'
colour_red="\e[0;31m"

PS1="$colour_blue\u$colour_reset@$colour_red\h$colour_reset:$colour_cyan\w$colour_reset"'$(__git_ps1)\n\$ '

