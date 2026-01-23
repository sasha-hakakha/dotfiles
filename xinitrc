#!/bin/sh

# Set wallpaper
feh --bg-scale /home/sash/lain.jpg &

# Start slstatus (installed in /usr/local/bin)
# This will update your dwm status bar
/usr/local/bin/slstatus &

# Start dwm
exec /usr/local/bin/dwm

