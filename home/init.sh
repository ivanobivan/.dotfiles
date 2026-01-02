#!/bin/bash

install() {
    local cmd="$1"

    if dpkg -s "$pkg" >/dev/null 2>&1; then
        echo "Package $cmd already installed"
    else
        echo "Install $cmd pakage"
        sudo apt install -y "$cmd"
    fi
}

echo "====================================="
echo "===       HELLO, LES'T START      ==="
echo "====================================="

sudo apt update

packages=(
    vim curl wget xclip tar htop cmatrix tree
    translate-shell unzip build-essential
    ripgrep fd-find
)

for elem in "${packages[@]}"; do
    install "$elem"
done

mkdir -p ~/temp
cd ~/temp

# Google Chrome
if command -v google-chrome >/dev/null 2>&1 || command -v google-chrome-stable >/dev/null 2>&1; then
    echo "Google Chrome is already installed."
else
    wget -O google-chrome.deb \
        https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome.deb
    rm google-chrome.deb
fi

# Telegram
if command -v telegram-desktop >/dev/null 2>&1; then
    echo "Telegram Desktop already installed."
else
    wget -O tg.tar https://telegram.org/dl/desktop/linux
    tar -xvf tg.tar
    sudo mv Telegram /opt/
    rm -rf Telegram tg.tar
fi

# Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

# Nerd Fonts
mkdir -p ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.fonts
fc-cache -f -v
rm JetBrainsMono.zip

# Lazygit
LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest |
    grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz \
    "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit lazygit.tar.gz

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc

export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
nvm install --lts
npm install -g tree-sitter-cli

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Kitty
mkdir -p ~./local/bin
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
echo 'kitty.desktop' >~/.config/xdg-terminals.list

sudo apt --fix-broken install

#symlinks
ln -sf ~/workspace/dotfiles/home/config/kitty ~/.config/kitty
ln -sf ~/workspace/dotfiles/home/config/lazygit ~/.config/lazygit
ln -sf ~/workspace/dotfiles/home/config/nvim ~/.config/nvim
ln -sf ~/workspace/dotfiles/home/.bashrc ~/.bashrc
ln -sf ~/workspace/dotfiles/home/.inputrc ~/.inputrc

echo "=== END of instllation, now restart terminal ==="
