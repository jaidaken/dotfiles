setxkbmap -model thinkpad -layout gb 
xrdb ~/.Xresources
#xinput set-prop 11 273 1
#xinput set-prop 11 281 1
#xinput set-prop 11 290 0
pactl load-module module-bluetooth-discover
systemctl --user import-environment DISPLAY
#XDG_CONFIG_HOME="$HOME/.config"
#export XDG_CONFIG_HOME
#compton -vsync opengl -cb &
#pgrep redshift &> /dev/null || redshift &> /dev/null &
#exec awesome
#exec i3
#exec herbstluftwm
#sxhkd &
exec bspwm
