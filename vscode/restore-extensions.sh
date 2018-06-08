#!/usr/bin/env bash
ROOT=$(dirname "$0")
cd $ROOT
cat extensions.list | xargs -L 1 code --install-extension
