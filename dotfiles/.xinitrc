#!/bin/sh

xset +fp $HOME/lib/fonts
xrdb $HOME/.Xdefaults
xmodmap $HOME/.Xmodmap
xset r rate 200 40
setxkbmap -option ctrl:nocaps -option terminate:ctrl_alt_bksp
redshift -l 35:135 &
xpywm 2>/tmp/xpywm.log &
xpymon 2>/tmp/xwpymon.log &
xpylog 2>/tmp/xpylog.log &
emacs &
urxvt -geometry 80x35-64-0
