#!/usr/bin/env bash
ROOT=$(dirname "$0")
cd $ROOT
apm list --installed --bare > packages.list
