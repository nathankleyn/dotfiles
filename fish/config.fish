source ~/.fish-private

# Configure Fish theme

set -g theme_color_scheme solarized-dark
set -g theme_display_date no

# Add directories to the PATH

set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -x PATH /usr/local/opt/grep/libexec/gnubin $PATH
set -x PATH /usr/local/opt/ruby/bin $PATH
set -x PATH $PATH /usr/local/bin
set -x PATH $PATH /usr/local/sbin
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH ~/.gem/bin
set -x PATH $PATH ~/.okta-aws-cli

# Export some lovely environment variables

set -x _JAVA_OPTIONS "-Djava.net.preferIPv4Stack=true -Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"
set -x BROWSER chromium
set -x CHROME_BIN /Users/nathan/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
set -x DOCKER_HOST unix:///var/run/docker.sock
set -x EDITOR vim
set -x FIREFOX_BIN /Users/nathan/Applications/Firefox.app/Contents/MacOS/firefox
set -x FLEETCTL_ENDPOINT http://localhost:4001
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

eval (direnv hook fish)
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
