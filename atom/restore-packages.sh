#!/usr/bin/env bash
ROOT=$(dirname "$0")
cd $ROOT
apm install --packages-file packages.list
