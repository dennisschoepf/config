#!/bin/sh

TMPDIR="bootstrap-tmp"

exists()
{
  command -v "$1" >/dev/null 2>&1
}

# Starting bootstrap
echo "--- Starting bootstrap ---"
mkdir $TMPDIR
cd $TMPDIR

# Theming
# Nordic
if [ -d "~/.themes/Nordic-darker" ]
then
	echo "Installing Nordic Theme ..."
	wget https://github.com/EliverLara/Nordic/releases/download/v1.9.0/Nordic-darker.tar.xz
	tar -xf Nordic-darker.tar.xz
	mkdir -p ~/.themes
	mv Nordic-darker ~/.themes/Nordic-darker
	gsettings set org.gnome.desktop.interface gtk-theme Nordic-darker
	gsettings set org.gnome.desktop.wm.preferences theme Nordic-darker
	echo "Nordic Theme installed"
else
	echo "Nordic theme already installed"
fi

# Breeze Cursor
echo "Installing Breeze Cursor ..."
sudo apt install breeze-cursor-theme
gsettings set org.gnome.desktop.interface cursor-theme Breeze_Snow
echo "Breeze Cursor installed"

# Fonts
sudo apt install fonts-firacode
sudo apt install fonts-ibm-plex

# Applications
# ZSH and oh-my-zsh
sudo apt install zsh
if [ -d "~/.oh-my-zsh" ]
then
  echo "Oh my zsh already installed"
else
  echo "Installing oh my zsh ..."
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  echo "Installed oh my zsh ..."
fi

# Alacritty
echo "Installing Alacritty ..."
sudo apt install alacritty
echo "Alacritty installed."

# Node (NVM)
if exists node; then
  echo "Node already installed"
else
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  source .zshrc
fi

# Cargo
if exists cargo; then
  echo "Cargo already installed"
else
  curl https://sh.rustup.rs -sSf | sh
  cargo install exa
  cargo install silicon
  cargo install bat
fi

# Emacs
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs27

# Flameshot
sudo apt install flameshot

# Config files
if [ -d "~/.config/yadm" ]
then
  echo "Downloading config files ..."
  sudo apt install yadm
  yadm clone git@github.com:dennisschoepf/config.git
  echo "Config files downloaded."
fi

# Cleanup
cd ..
rm -r $TMPDIR
