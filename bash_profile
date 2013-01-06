#
# ~/.bash_profile
#

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


[[ -f ~/.bashrc ]] && . ~/.bashrc
