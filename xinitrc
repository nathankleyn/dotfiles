#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

start-pulseaudio-x11
xrdb -merge ~/.Xresources
exec xmonad
# exec awesome
