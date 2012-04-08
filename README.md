# Sam Aaron's Dotfiles

When installing on a fresh machine:

* Switch default shell to zsh (Preferences->Users->Advaced Options...)
* Download, compile and install cmd-key-happy: https://github.com/aim-stuff/cmd-key-happy
  - `make`
  - `sudo make install`
  - `make install-plist`
* Download, compile and cp to `~/bin`: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
  - `make`
  - `cp reattach-to-usernamespace ~/bin`
* Install tmux
  - `brew install tmux`
* Install hub
  - `brew install hub`
