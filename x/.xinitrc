#!/usr/bin/fish

xrdb -merge ~/.Xresources

compton &
feh --bg-scale ~/Downloads/IMG_20190516_201424-EFFECTS.jpg &
xss-lock ~/.bin/lock &
xbacklight -set 30 &
amixer set Master 0% &
amixer set Master mute &
redshift &

exec i3
