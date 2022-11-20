#!/bin/bash

PACKAGE_INSTALL="apt install"
#PACKAGE_INSTALL="pacman -Syu"

function donotdo() {
# Software
sudo ${PACKAGE_INSTALL} -y cmake tmux meld zsh g++ build-essential kitty git playerctl cinnamon xclip curl meld wget tree nmap tldr

# Configs
echo "Cloning configs from github repo"
mkdir -p ~/Repos
cd Repos
git clone https://github.com/steelswords/configs.git
cd configs


# Set shell
echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Setting shell to zsh"
chsh -s /usr/bin/zsh

## Install configs
#cp -r .i3 .zsh .bashrc .gitconfig .profile .tmux.conf .viminfo .vimrc .zshrc -t ~

echo "Setting up configs"
meld ~/Repos/configs ~

# i3-gaps
mkdir -p ~/Repos
cd ~/Repos
git clone https://github.com/Airblader/i3.git
echo "Installing dependencies for i3-gaps"
sudo apt install -y feh nemo i3status i3lock dmenu meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev
cd i3
mkdir -p build
cd build
meson --prefix /usr/local
ninja
sudo ninja install

echo "Collecting Joplin"
cd ~/Applications
wget https://github.com/laurent22/joplin/releases/download/v2.8.8/Joplin-2.8.8.AppImage
chmod +x Joplin-*.AppImage
sudo ln -sn "$(realpath Joplin-*.AppImage)" /usr/bin/joplin
}
# Neovim
#mkdir -p ~/Applications
#cd ~/Applications
#curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
#chmod +x nvim.appimage
#sudo ln -sn "$(realpath nvim.appimage)" /bin/vim
#sudo ln -sn "$(realpath nvim.appimage)" /usr/bin/nvim
# Or this
mkdir -p ~/Repos
cd ~/Repos
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen ripgrep
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo $PACKAGE_INSTALL python3-neovim

# Manual setup stuff
todoListFile="~/setup-todo.md"
manualToDoList="""
List of things to do:
----------------------------------
- [ ] Install Vimium on all browsers
- [ ] Set Joplin's editing mode to vim
"""

echo "$manualToDoList"
if [[ -f "$todoListFile" ]]
then
  echo "$manualToDoList" >> "$todoListFile"
  echo -e "\nI have helpfully written this list here: $todoListFile"
fi
