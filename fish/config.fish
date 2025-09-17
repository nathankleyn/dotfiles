source ~/.fish-private

# Configure Fish theme

set -g theme_color_scheme solarized-dark
set -g theme_display_date no

# Add directories to the PATH

set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -x PATH /usr/local/opt/grep/libexec/gnubin $PATH
set -x PATH /usr/local/opt/ruby/bin $PATH
set -x PATH /opt/homebrew/bin $PATH
set -x PATH /opt/homebrew/sbin $PATH
set -x PATH /opt/homebrew/opt/coreutils/libexec/gnubin $PATH
set -x PATH /opt/homebrew/opt/grep/libexec/gnubin $PATH
set -x PATH /opt/homebrew/opt/ruby/bin $PATH
set -x PATH ~/.bun/bin $PATH
set -x PATH ~/.cargo/bin $PATH
set -x PATH ~/.rye/shims $PATH
set -x PATH ~/.gem/bin $PATH
set -x PATH ~/.okta-aws-cli $PATH
set -x PATH ~/Library/Python/3.7/bin $PATH

# Export some lovely environment variables

# set -x _JAVA_OPTIONS "-Djava.net.preferIPv4Stack=true -Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"
set -x EDITOR vim
set -x GEM_HOME ~/.gem
set -x HOMEBREW_NO_ANALYTICS 1
set -x LANG en_US.UTF-8

# Make some functions to do handy things.

function gs
  git status $argv
end

function gc
  git clean -dfx -e .vagrant -e mesos $argv
end

function ll
  ls -lG $argv
end

function typora
  open -a Typora $argv
end

# Extend Fish with direnv and iTerm integrations.
direnv hook fish | source
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Enable fnm
fnm env --use-on-cd | source


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
