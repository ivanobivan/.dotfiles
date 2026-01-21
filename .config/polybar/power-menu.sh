choice=$(printf "  Power off\n⏾  Sleep\n  Reboot\n󰗽  Log out\n  Cancel" | rofi -dmenu -i -p "Power")

case "$choice" in
"  Power off")
    systemctl poweroff
    ;;
"⏾  Sleep")
    ~/.config/i3/lock.sh && systemctl suspend
    ;;
"  Reboot")
    systemctl reboot
    ;;
"󰗽  Log out")
    i3-msg exit
    ;;
*)
    exit 0
    ;;
esac
