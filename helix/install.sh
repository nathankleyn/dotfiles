#!/usr/bin/env bash

mkdir -p ~/.config/helix

ln -fs $(pwd)/config.toml ~/.config/helix/config.toml
ln -fsn $(pwd)/themes ~/.config/helix/themes
