#!/bin/bash

echo "Installing .zshrc"
rm $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

echo "Installing git configuration"
rm $HOME/.gitconfig 2>/dev/null
rm $HOME/.gitignore 2>/dev/null

ln -s $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/git/.gotignore $HOME/.gitignore

# ZSH THEME
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/cdimascio/lambda-zsh-theme.git /tmp/lambda
cp /tmp/lambda/cdimascio-lambda.zsh-theme $HOME/.oh-my-zsh/themes/

# Gnome terminal
dconf load /org/gnome/terminal/legacy/profiles:/ < $HOME/.dotfiles/gnome-terminal/gnome-terminal-profiles.dconf

# Install fonts
cp $HOME/.dotfiles/fonts/*.* $HOME/.fonts/
