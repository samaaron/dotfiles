export CLOJURESCRIPT_HOME="/Users/sam/Development/cljs/clojurescript"
export NODE_PATH="/usr/local/lib/node_modules"

#lovely java 1.7 home
#export JAVA_HOME=$(/usr/libexec/java_home)

#lovely java 1.6 home
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

#set the path (With Java 1.6)
export PATH=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Commands:/Applications/Octave.app/Contents/Resources/bin:/Applications/Postgres.app/Contents/MacOS/bin:/Users/sam/bin:/Users/sam/.rvm/bin:/usr/local/texlive/2011/bin/x86_64-darwin/:/usr/local/git/bin:/usr/local/bin:/opt/local/bin:$PATH:/bin:/usr/local/Cellar/python/2.7.1/bin/:/Users/sam/.gem/ruby/1.8/bin:/usr/local/mysql/bin:/usr/local/sbin:/Applications/SuperCollider:$CLOJURESCRIPT_HOME/bin:/Users/sam/.cabal/bin

#(with java 1.7)
#export PATH=/Applications/Octave.app/Contents/Resources/bin:/Applications/Postgres.app/Contents/MacOS/bin:/Users/sam/bin:/Users/sam/.rvm/bin:/usr/local/texlive/2011/bin/x86_64-darwin/:/usr/local/git/bin:/usr/local/bin:/opt/local/bin:$PATH:/bin:/usr/local/Cellar/python/2.7.1/bin/:/Users/sam/.gem/ruby/1.8/bin:/usr/local/mysql/bin:/usr/local/sbin:/Applications/SuperCollider:$CLOJURESCRIPT_HOME/bin:/Users/sam/.cabal/bin

#enforce ack from /usr/local/bin
alias ack="/usr/local/bin/ack"

#make ls pretty-pretty
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'
alias l="ls -lh"

alias emacs="/usr/local/bin/emacsclient -ct"
alias e="/usr/local/bin/emacsclient"
alias es="/usr/local/bin/emacs --daemon"

## cd to the directory of the current emacs buffer
alias cde='cd $(emacsclient -e "(with-current-buffer (window-buffer (frame-selected-window)) default-directory)" | '"sed -E 's/(^\")|(\"$)//g')"

#enable completion system
autoload -U compinit
compinit
zstyle ':completion:*' menu select


#set history stuff
HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY         # puts timestamps in the history

setopt HIST_VERIFY              # when using ! cmds, confirm first
setopt HIST_IGNORE_DUPS         # ignore same commands run twice
setopt APPEND_HISTORY           # don't overwrite history
setopt INC_APPEND_HISTORY       # write after each command
setopt extended_glob
setopt autopushd

bindkey ' ' magic-space

#set emacs the shell editor
export EDITOR='emacsclient -ct'

export EMACS='/usr/local/bin/emacs'

source ~/.dotfiles/gitstatus/gitstatus.zsh

#make the prompt pretty-pretty
autoload -U colors && colors
setopt prompt_subst
setopt notransient_rprompt
export PS1=$'
%{\e[0;34m%}∴ $(prompt_git_info)%{\e[0;34m%}%d%{\e[0m%}
%Bλ '

# get zsh to offer corrections for incorrect commands
setopt correct

# allows the command stop to be used to stop jobs similar to C shells
alias stop='kill -TSTP'

#kill region for later yanking
bindkey '\C-\\' kill-region

#enable bash style backward-kill-word
bindkey '\C-]' vi-backward-kill-word

# Upgrade Ctrl-q from just push-line to push-line-or-edit
bindkey '\eq' push-line-or-edit

setopt promptsubst

# enable zmv http://www.refining-linux.org/archives/36/ZSH-Gem-1-Programmable-file-renaming/
autoload -U zmv

##https://github.com/defunkt/hub
function git(){hub "$@"}

## RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

if [ "$INSIDE_EMACS" ]; then
  alias emacs="/usr/local/bin/emacsclient --no-wait"
  export EDITOR='emacsclient --no-wait'
  TERM=xterm-256color
fi
