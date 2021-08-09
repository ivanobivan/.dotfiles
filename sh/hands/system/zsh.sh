cd ~
echo "=== ZSH preporation ==="
echo "1. Install zsh"
sudo apt install zsh

echo "2. Install o my zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | bash

echo "3. Install Powerline9k theme"
git clone https://github.com/bhilburn/powerlevel9k
sudo apt-get install fonts-powerline

echo "4. Install fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "5. Install zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "6. Install syntax-highlights"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
    