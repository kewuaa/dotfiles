#! /bin/sh

if command -v fcitx5 &> /dev/null
then
    fcitx5 -d
fi
picom -b
slstatus &
while feh --bg-fill --randomize --recursive ~/.wallpaper;
do
    sleep 900
done &
xautolock -corners -+-+ -time 30 -locker slock
