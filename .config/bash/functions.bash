qq() {
    if [ -z "$1" ]; then
        ls ~/workspace/dotfiles/help/*.md 2>/dev/null | xargs -n1 basename -s .md
        return 1
    fi
    cat ~/workspace/dotfiles/help/"$1".md
}

da() {
    if [ -z "$1" ]; then
        echo "Доступные команды:"
        echo "  path    — показать PATH построчно"
        return 0
    fi

    case "$1" in
    path)
        echo "$PATH" | tr ':' '\n'
        ;;
    *)
        echo "❌ Неизвестная команда: $1"
        return 1
        ;;
    esac
}

play() {
    names=(chill electro jazz lush lofi)

    declare -A list
    list[chill]='http://ice1.somafm.com/dronezone-128-mp3'
    list[electro]='http://ice1.somafm.com/thetrip-128-mp3'
    list[lush]='http://ice1.somafm.com/lush-128-mp3'
    list[lofi]='http://stream.laut.fm/lofi'

    station="${1:-lofi}"

    if [[ ! " ${names[@]} " =~ " ${station} " ]]; then
        echo "❌ wrong station: $station"
        echo "stations: ${names[*]}"
        return 1
    fi

    echo "🎧 Listen: $station"
    echo "🔗 ${list[$station]}"
    vlc --intf dummy --play-and-exit "${list[$station]}"
}
