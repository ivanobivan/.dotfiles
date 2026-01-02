#!/bin/bash
set -e

echo "====================================="
echo "===        PRUNE STARTED          ==="
echo "====================================="

# -------------------------
# APT PACKAGES
# -------------------------
packages=(
    vim curl wget xclip tar htop cmatrix tree
    translate-shell unzip build-essential
    ripgrep fd-find
)

echo "Removing apt packages..."
sudo apt purge -y "${packages[@]}" || true
sudo apt autoremove -y

# -------------------------
# GOOGLE CHROME
# -------------------------
if dpkg -s google-chrome-stable >/dev/null 2>&1; then
    echo "Removing Google Chrome..."
    sudo apt purge -y google-chrome-stable
fi

# -------------------------
# TELEGRAM
# -------------------------
if [ -d /opt/Telegram ]; then
    echo "Removing Telegram..."
    sudo rm -rf /opt/Telegram
fi

# -------------------------
# NEOVIM
# -------------------------
if [ -d /opt/nvim-linux-x86_64 ]; then
    echo "Removing Neovim..."
    sudo rm -rf /opt/nvim-linux-x86_64
fi

# -------------------------
# NERD FONTS
# -------------------------
echo "Removing JetBrainsMono Nerd Fonts..."
rm -rf ~/.fonts/JetBrainsMono*
fc-cache -f -v || true

# -------------------------
# LAZYGIT
# -------------------------
if [ -f /usr/local/bin/lazygit ]; then
    echo "Removing lazygit..."
    sudo rm -f /usr/local/bin/lazygit
fi

# -------------------------
# NVM / NODE / NPM
# -------------------------
if [ -d ~/.nvm ]; then
    echo "Removing NVM and Node..."
    rm -rf ~/.nvm
fi

# remove npm globals installed by script
if command -v npm >/dev/null 2>&1; then
    npm uninstall -g tree-sitter-cli || true
fi

# -------------------------
# FZF
# -------------------------
if [ -d ~/.fzf ]; then
    echo "Removing fzf..."
    ~/.fzf/uninstall || true
    rm -rf ~/.fzf
fi

# -------------------------
# KITTY
# -------------------------
echo "Removing Kitty..."
rm -rf ~/.local/kitty.app
rm -f ~/.local/bin/kitty ~/.local/bin/kitten
rm -f ~/.local/share/applications/kitty.desktop
rm -f ~/.local/share/applications/kitty-open.desktop
rm -f ~/.config/xdg-terminals.list

# -------------------------
# SYMLINKS (ONLY if symlink)
# -------------------------
echo "Removing symlinks..."

for link in \
    ~/.config/kitty \
    ~/.config/lazygit \
    ~/.config/nvim \
    ~/.bashrc \
    ~/.inputrc; do
    if [ -L "$link" ]; then
        rm "$link"
    fi
done

# -------------------------
# TEMP DIR
# -------------------------
rm -rf ~/temp

echo "====================================="
echo "===      PRUNE FINISHED           ==="
echo "====================================="
echo "Restart terminal recommended"
