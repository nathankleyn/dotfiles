source ~/.fish-private

# Add directories to the PATH

# set -x PATH $PATH ~/.bin
# set -x PATH $PATH ~/.npm/bin
# set -x PATH $PATH ~/.yarn/bin
# set -x PATH $PATH /opt/hbase/bin
set -x PATH $PATH /usr/local/bin
set -x PATH $PATH /usr/local/opt/ruby/bin
set -x PATH $PATH /usr/local/sbin
set -x PATH $PATH ~/.cabal/bin
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH ~/.gem/bin
set -x PATH $PATH ~/.okta-aws-cli

# Export some lovely environment variables

set -x _JAVA_OPTIONS "-Djava.net.preferIPv4Stack=true -Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"
set -x BROWSER chromium
set -x CHROME_BIN /Users/nathan/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
set -x DOCKER_API_VERSION 1.23
set -x DOCKER_HOST unix:///var/run/docker.sock
set -x EDITOR vim
set -x FIREFOX_BIN /Users/nathan/Applications/Firefox.app/Contents/MacOS/firefox
set -x FLEETCTL_ENDPOINT http://localhost:4001
set -x GEM_HOME ~/.gem
set -x HOMEBREW_NO_ANALYTICS 1
set -x IHQ_HOME ~/repos/ihq
set -x LANG en_US.UTF-8
set -x RUST_SRC_PATH ~/repos/rust/src

# Make some functions to do handy things.

function ihq
    cd $IHQ_HOME
end

function ihqp
    ihq; and cd platform
end

function gs
  git status
end

function gc
  git clean -dfx -e .vagrant -e mesos
end

function ll
    ls -lG $argv
end

function rspec
  rspec -c -b
end

function thor
  bundle exec thor
end
