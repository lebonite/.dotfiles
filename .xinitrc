if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
	eval $(dbus-launch --exit-with-session --sh-syntax)
fi
systemctl --user import-environment DISPLAY XAUTHORITY

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
        dbus-update-activation-environment DISPLAY XAUTHORITY
fi




setxkbmap -layout se

xrandr --output DP-3 --mode 3440x1440 --rate 144
xrandr --output DP-2 --mode 3440x1440 --rate 144
xrandr --output DP-1 --mode 3440x1440 --rate 144

exec dwm
