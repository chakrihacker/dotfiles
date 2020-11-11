#!/bin/bash

system_type=$(uname -s)

if [ "$system_type" = "Darwin" ]; then

  # install homebrew if it's missing
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  if [ -f "$HOME/Brewfile" ]; then
    echo "Updating homebrew bundle"
    brew bundle --global
  fi

fi

# Setup git
git config --global credential.helper 'osxkeychain'
git config --global user.name 'Subramanya Chakravarthy'
git config --global user.email 'chanty.chakravarthy@gmail.com'
git config --global core.excludesfile ~/.gitignore_global

echo "Updating the yadm repo origin URL"
yadm remote set-url origin "git@github.com:chakrihacker/dotfiles.git"

# install omz

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install omz plugins

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions