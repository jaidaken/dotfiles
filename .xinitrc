#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# userresources=$HOME/.Xresources
# usermodmap=$HOME/.Xmodmap
# sysresources=/etc/X11/xinit/.Xresources
# sysmodmap=/etc/X11/xinit/.Xmodmap

# DEFAULT_SESSION='bspwm'

# # merge in defaults and keymaps

# if [ -f $sysresources ]; then
#     xrdb -merge $sysresources
# fi

# if [ -f $sysmodmap ]; then
#     xmodmap $sysmodmap
# fi

# if [ -f "$userresources" ]; then
#     xrdb -merge "$userresources"
# fi

# if [ -f "$usermodmap" ]; then
#     xmodmap "$usermodmap"
# fi

# # start some nice programs

# if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#     for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#         [ -x "$f" ] && . "$f"
#     done
#     unset f
# fi

# get_session(){
# 	local dbus_args=(--sh-syntax --exit-with-session)
# 	case $1 in
# 		awesome) dbus_args+=(awesome) ;;
# 		bspwm) dbus_args+=(bspwm) ;;
# 		budgie) dbus_args+=(budgie-desktop) ;;
# 		cinnamon) dbus_args+=(cinnamon-session) ;;
# 		deepin) dbus_args+=(startdde) ;;
# 		enlightenment) dbus_args+=(enlightenment_start) ;;
# 		fluxbox) dbus_args+=(startfluxbox) ;;
# 		gnome) dbus_args+=(gnome-session) ;;
# 		i3|i3wm) dbus_args+=(i3 --shmlog-size 0) ;;
# 		jwm) dbus_args+=(jwm) ;;
# 		kde) dbus_args+=(startplasma-x11) ;;
# 		lxde) dbus_args+=(startlxde) ;;
# 		lxqt) dbus_args+=(lxqt-session) ;;
# 		mate) dbus_args+=(mate-session) ;;
# 		xfce) dbus_args+=(xfce4-session) ;;
# 		openbox) dbus_args+=(openbox-session) ;;
# 		*) dbus_args+=($DEFAULT_SESSION) ;;
# 	esac

# 	echo "dbus-launch ${dbus_args[*]}"
# }

# exec $(get_session "$1")

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset +fp /usr/share/fonts/local &
xset fp rehash &
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr


# Autostart applications
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

#exec herbstluftwm --locked
#exec i3 --shmlog-size 0
sxhkd &
exec bspwm

exec polybar
exec "picom -b --experimental-backends"
#exec manjaro-hello
#exec_always sbxkb
exec xautolock -time 10 -locker blurlock
exec wal -i "Pictures/Wallpapers/"
exec discord
exec pywal-discord
exec firefox
exec code
exec nm-applet
#exec xfce4-power-manager
exec pamac-tray
#exec clipit
exec blueman-applet
exec pasystray
exec sleep 0.6 && i3-msg "exec $term"
exec sleep 0.8 && i3-msg "exec $term -e $SHELL -c 'neofetch && $SHELL'"
exec sleep 1 && exec spotify
exec ff-theme-util
exec fix_xcursor
urxvtd -q -o -f

#exec herbstluftwm --locked
#exec i3 --shmlog-size 0
sxhkd &
exec bspwm

