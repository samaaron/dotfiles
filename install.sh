#!/bin/bash
# Assumes dotfiles dir is located at ~/.dotfiles

echo "Creating ~/bin"
mkdir -p ~/bin

echo "Creating symbolic links for config files"
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/cmd-key-happy.lua ~/.cmd-key-happy.lua
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

echo "Installing Key Bindings"
mkdir -p ~/Library/KeyBindings
cp ~/.dotfiles/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

echo "Installing useful brews:"
brew install ack git hub tig tmux tree

echo "Now quit iTerm2 and copy ~/.dotfiles/com.googlecode.iterm2.plist into ~/Library/Preferences then relaunch."
echo ""
echo "Next,  setup cmd-key-happy:"
echo "  cd /tmp"
echo "  git clone https://github.com/aim-stuff/cmd-key-happy"
echo "  cd /tmp/cmd-key-happy"
echo "  make"
echo "  sudo make install"
echo "  make install-plist"
echo ""
echo "Finally, setup tmux-MacOSX-pasteboard:"
echo "  cd /tmp"
echo "  git clone https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard"
echo "  cd /tmp/tmux-MacOSX-pasteboard"
echo "  make"
echo "  cp reattach-to-user-namespace ~/bin"
