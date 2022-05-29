#!/bin/sh
eval "$(xdotool getmouselocation --shell)"
xdotool mousemove 960 1080
if [ "$2" = "move" ]; then
	bspc node -d "$1"
elif [ "$2" = "follow" ]; then
	bspc node -d "$1" -f
else
	bspc desktop -f "$1"
fi
xdotool mousemove --screen $SCREEN $X $Y
