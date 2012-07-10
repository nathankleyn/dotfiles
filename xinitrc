#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

start-pulseaudio-x11
exec ck-launch-session dbus-launch xmonad
