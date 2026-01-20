#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

install() {
    local pkg="$1"

    if dpkg -s "$pkg" >/dev/null 2>&1; then
        printf "${GREEN}✔${NC} %s already installed\n" "$pkg"
    else
        printf "${BLUE}➜${NC} Installing %s\n" "$pkg"
        sudo apt install -y "$pkg"
    fi
}

link_configs() {
    local SRC_BASE="$HOME/workspace/dotfiles/home/config"
    local DST_BASE="$HOME/.config"

    mkdir -p "$DST_BASE"

    for SRC in "$SRC_BASE"/*; do

        [ -d "$SRC" ] || continue

        local NAME
        NAME="$(basename "$SRC")"
        local DST="$DST_BASE/$NAME"

        if [ -e "$DST" ] || [ -L "$DST" ]; then
            rm -rf "$DST"
            printf "${RED}!${NC} Replaced existing: %s\n" "$DST"
        fi

        ln -s "$SRC" "$DST"
        printf "${BLUE}➜${NC} Symlink created: %s → %s\n" "$DST" "$SRC"
    done
}

link_home_files() {
    local links=(
        "$HOME/workspace/dotfiles/home/.bashrc:$HOME/.bashrc"
        "$HOME/workspace/dotfiles/home/.inputrc:$HOME/.inputrc"
    )

    for pair in "${links[@]}"; do
        local SRC="${pair%%:*}"
        local DST="${pair##*:}"

        if [ -e "$DST" ] || [ -L "$DST" ]; then
            rm -rf "$DST"
            printf "${RED}!${NC} Replaced existing: %s\n" "$DST"
        fi

        ln -s "$SRC" "$DST"
        printf "${BLUE}➜${NC} Symlink created: %s → %s\n" "$DST" "$SRC"
    done
}

echo "====================================="
echo "===       HELLO, LES'T START      ==="
echo "====================================="

# sudo apt update

packages=(
    vim curl wget xclip tar htop cmatrix tree
    translate-shell unzip build-essential
    ripgrep fd-find ranger
    neofetch
    i3 polybar i3lock xss-lock rofi feh picom
    pulsemixer brightnessctl flameshot
)

for elem in "${packages[@]}"; do
    install "$elem"
done

mkdir -p ~/temp
cd ~/temp

# Google Chrome
if command -v google-chrome >/dev/null 2>&1 || command -v google-chrome-stable >/dev/null 2>&1; then
    printf "${GREEN}✔${NC} Google Chrome already installed\n"
else
    printf "${BLUE}➜${NC} Installing Google Chrome\n"
    wget -O google-chrome.deb \
        https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome.deb
    rm google-chrome.deb
fi

# Telegram
if [ -d /opt/Telegram ]; then
    printf "${GREEN}✔${NC} Telegram already installed\n"
else
    printf "${BLUE}➜${NC} Installing Telegram\n"
    wget -O tg.tar https://telegram.org/dl/desktop/linux
    tar -xvf tg.tar
    sudo mv Telegram /opt/
    rm -rf Telegram tg.tar
fi

# Neovim
if [ -d /opt/nvim-linux-x86_64 ]; then
    printf "${GREEN}✔${NC} Neovim already installed\n"
else
    printf "${BLUE}➜${NC} Installing Neovim\n"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    rm nvim-linux-x86_64.tar.gz
fi

# Nerd Fonts (JetBrainsMono)
if ls ~/.fonts/JetBrainsMono*NerdFont* >/dev/null 2>&1; then
    printf "${GREEN}✔${NC} JetBrainsMono Nerd Font already installed\n"
else
    printf "${BLUE}➜${NC} Installing JetBrainsMono Nerd Font\n"
    mkdir -p ~/.fonts
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
    unzip -q JetBrainsMono.zip -d ~/.fonts
    fc-cache -f -v
    rm JetBrainsMono.zip
fi

# Lazygit
if [ -f ~/.config/nvim/lua/config/lazy.lua ] ||
    [ -d ~/.config/nvim/lua/lazyvim ]; then
    printf "${GREEN}✔${NC} LazyVim already installed\n"
else
    printf "${BLUE}➜${NC} Installing LazyVim\n"
    LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest |
        grep -Po '"tag_name": *"v\K[^"]*')
    curl -Lo lazygit.tar.gz \
        "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit -D -t /usr/local/bin/
    rm lazygit lazygit.tar.gz
fi

# NVM
if [ -d "$HOME/.nvm" ]; then
    printf "${GREEN}✔${NC} NVM already installed\n"
else
    printf "${BLUE}➜${NC} Installing NVM\n"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"
    nvm install --lts
    npm install -g tree-sitter-cli
fi

# fzf
if [ -d "$HOME/.fzf" ]; then
    printf "${GREEN}✔${NC} fzf already installed\n"
else
    printf "${BLUE}➜${NC} Installing fzf\n"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# Kitty
if [ -d "$HOME/.local/kitty.app" ]; then
    printf "${GREEN}✔${NC} Kitty already installed\n"
else
    printf "${BLUE}➜${NC} Installing Kitty\n"
    mkdir -p ~./local/bin
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    echo 'kitty.desktop' >~/.config/xdg-terminals.list
fi

sudo apt --fix-broken install

link_configs
link_home_files

echo "====================================="
echo "===     END OF INSTALLATION       ==="
echo "====================================="
