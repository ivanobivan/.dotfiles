#!/bin/bash

install(){
    echo "=== Instal $1 ==="
    sudo apt install $1
}

check() {
    local path=$(which $1)
    if [[ ! -f $path ]]
    then
        install $1
    fi
}

checkmanager() {
    local res=$(dpkg -s $1 | grep Status | cut -d " " -f 2)
    if [[ $res != "install" ]]
    then
        install $1
    fi
}

sudo apt update
sudo apt upgrade
sudo apt install language-pack-en

echo "====================================="
echo "=== Let's set up your environment ==="
echo "====================================="

#terminal part
#grc - color presets for grcgr editor noice logs
#xdotool & wmctrl - help you move window to other screen

packages=(
    "nano"
    "wget"
    "curl"
    "ldd"
    "tree"
    "strace"
    "git"
    "zsh"
    "tmux"
    "git-core"
    "mercurial"
    "grc"
    "xdotool"
    "wmctrl"
)

for elem in ${packages[@]}
do
    check $elem
done


#common part

distr=(
    "maven",
    "postgresql",
    "postgresql-contrib"
    
)

for elem in ${distr[@]}
do
    install $elem
done

#gui part
#lxappearance - type it in your awesome execute line and custom theme
#xprop - get the info about any window of all you system "xprop| grep 'CLASS" - just grep class
#numix-gtk-theme - nice xfce theme
#arc-theme - nice xfce theme too
#numix-icon-theme - nice xfce icon kit
#papirus-icon-theme - nice xfce icon kit like material
#moka-icon-theme - nice xfce icon kit
#xfce4-power-manager - xfce brightness plugin
#blueman - bluetooth xfce nice manager

awesome_distr=(
    "awesome"
    "awesome-extra"
    "lxappearance"
    "xprop"
)

for elem in ${awesome_distr[@]}
do
    install $elem
done

xfce_distr=(
    "xfce"
    "xfce4-terminal"
    "moka-icon-theme"
    "papirus-icon-theme"
    "arc-theme"
    "numix-gtk-theme"
    "numix-icon-theme"
    "xfce4-power-manager"
)

for elem in ${xfce_distr[@]}
do
    install $elem
done

bash $HOME/workspace/dotfiles/sh/hands/system/zsh.sh


echo "=== NVM preporation ==="
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
command -v nvm

echo "=== ANS preporation ==="
curl https://cht.sh/:cht.sh > $HOME/cht.sh
sudo mv $HOME/cht.sh /usr/local/bin
sudo mv /usr/local/bin/cht.sh /usr/local/bin/ans
sudo chmod +x /usr/local/bin/ans

echo "=== MOVE preporation ==="
curl https://raw.githubusercontent.com/jc00ke/move-to-next-monitor/master/move-to-next-monitor > $HOME/move.sh
sudo mv $HOME/move.sh /usr/local/bin
sudo mv /usr/local/bin/move.sh /usr/local/bin/move
sudo chmod +x /usr/local/bin/move

echo "=== WORKSPACE preporation ==="

mkdir -p $HOME/workspace/develop


echo "=== AWESOME preporation ==="

cd ~/.config/awesome
git clone https://github.com/deficient/calendar.git
git clone https://github.com/pltanton/net_widgets.git
mkdir -p $HOME/.config/awesome/themes/multicolor
sudo cp -r $PWD/.config/awesome/* home/$USER/.config/awesome
ln -sf "$PWD/.config/awesome/rc.lua" "home/$USER/.config/awesome/rc.lua"
ln -sf "$PWD/.config/awesome/themes/multicolor/theme.lua" "home/$USER/.config/awesome/themes/multicolor/theme.lua"
cp -r $PWD/.config/awesome/themes/multicolor/icons/* $HOME/.config/awesome/themes/multicolor/icons


echo "=== DEVELOP preporation ==="
wget https://www.jetbrains.com/toolbox/download/download-thanks.html?platform=linux
cd ~/Downloads
#tar -xzfv ...


echo "=== LINK preporation ==="
sudo chmod +x $HOME/workspace/dotfiles/sh/hands/system
bash $HOME/workspace/dotfiles/sh/hands/system/link.sh


echo "=== DPKG preporation ==="
sudo dpkg-reconfigure keyboard-configuration

chsh -s `which zsh`
zsh
cd $HOME
source ~/.zshrc

echo "=== External path of envirintment setup ==="

