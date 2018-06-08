#!/usr/bin/env bash
ROOT=$(dirname "$0")
cd $ROOT
code --list-extensions > extensions.list
