setxkbmap -model thinkpad -layout gb 
xrdb ~/.Xresources
#compton -vsync opengl -cb &
#pgrep redshift &> /dev/null || redshift &> /dev/null &
#exec awesome
#exec i3
#exec herbstluftwm
sxhkd &
exec bspwm
