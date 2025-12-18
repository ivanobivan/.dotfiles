#!/bin/bash

install() {
  local cmd="$1"

  if command -v "$cmd" >/dev/null 2>&1; then
    echo "Пакет $cmd уже установлен"
  else
    echo "=== Устанавливаю пакет $cmd ==="
    sudo apt install -y "$cmd"
  fi
}

echo "====================================="
echo "=== Hello obivan,  install ubuntu ==="
echo "====================================="

sudo apt update
sudo apt upgrade

echo '=== start from required packages ==='

packages=(
  "curl"
  "wget"
  "git"
  "xclip"
  "unzip"
  "tar"
  "gtar"
  "gzip"
  "htop"
)

for elem in ${packages[@]}; do
  install $elem
done

echo '=== install fzf ==='

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# rg for debian
#$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep_14.1.1-1_amd64.deb
#$ sudo dpkg -i ripgrep_14.1.1-1_amd64.deb

#npm
# packages
#├── @angular/language-server@21.0.5
├── npm@11.6.2
└── tree-sitter-cli@0.26.3
# check npm list -g --depth=0 - вот тут проверить, что все пакеты корректно встали в global

echo "=== END of instllation ==="
