#!/bin/sh
# New Mac setup script, configured for macOS Catalina
# Author: Lucas

echo "Getting user information before setup:"
echo "Enter full name:"
read name
echo "Enter email for Git:"
read email

# Xcode
echo "Installing Xcode CLI..."
xcode-select --install

# Homebrew
if test ! $(which brew); then
  echo "Installing Homebrew..."
  # TODO: preinstalled ruby is deprecated, follow up
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "Updating Homebrew..."
brew update

# Git
echo "Installing Git..."
brew install git
echo "Configuring Git..."
git config --global user.name $name
git config --global user.email $email

# Dotfiles
echo "Copying dotfiles..."
# TODO: copy dotfiles, should really be configure dotfiles

echo "Installing brews..."
# TODO: install brews from .brewfile

# Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh
echo "Setting ZSH as default shell..."
chsh -s /bin/zsh

# Cask apps
echo "Installing applications with Cask..."
brew tap caskroom/cask
brew cask install ${apps[@]}
# TODO: install casks from .brewfile

# Theming
# Zsh
git clone https://github.com/dracula/zsh.git 
ln -s zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme #fix paths
# Vim
# iTerm2
# VSCode
# Sublime
