#set the path
export PATH=/Users/sam/.rvm/bin:/usr/local/git/bin:/Users/sam/bin:/usr/local/bin:$PATH:/bin:/usr/local/Cellar/python/2.7.1/bin/:/Users/sam/.gem/ruby/1.8/bin:/usr/local/mysql/bin:/usr/local/sbin

#enforce ack from /usr/local/bin
alias ack="/usr/local/bin/ack"

#make ls pretty-pretty
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'
alias l="ls -lh"


alias emacs="emacsclient -ct"
alias de="/usr/local/bin/emacs --daemon && dvtm"

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
setopt SHARE_HISTORY            # _all_ zsh sessions share the same history files
setopt INC_APPEND_HISTORY       # write after each command

setopt autopushd

bindkey ' ' magic-space

#set emacs the shell editor
export EDITOR='emacsclient -ct'

export EMACS='/usr/local/bin/emacsclient -ct'

#make the prompt pretty-pretty
autoload -U colors && colors
setopt prompt_subst
setopt notransient_rprompt
export PS1=$'
%{\e[0;34m%}∴ %d%{\e[0m%}
%Bλ '

preexec () {
    echo -ne "$reset_color"
}

precmd () {
    echo -ne "$B"
}

# get zsh to offer corrections for incorrect commands
setopt correct

# allows the command stop to be used to stop jobs similar to C shells
alias stop='kill -TSTP'


#add Ctrl-w capabilities (kill region for later yanking)
bindkey '\C-x' kill-region

#enable bash style backward-kill-word
bindkey '\C-w' vi-backward-kill-word

# Upgrade Ctrl-q from just push-line to push-line-or-edit
bindkey '\eq' push-line-or-edit

setopt promptsubst

if [[ -s /Users/sam/.rvm/scripts/rvm ]] ; then source /Users/sam/.rvm/scripts/rvm ; fi

Dirstacksize=32
DIRSTACKFILE="${HOME}"/.zdirs

autoload -U is-at-least
# Keep dirstack across logouts
if [[ -f ${DIRSTACKFILE} ]] && [[ ${#dirstack[*]} -eq 0 ]] ; then
    dirstack=( ${(uf)"$(< $DIRSTACKFILE)"} )
fi

# Make sure there are no duplicates
typeset -U dirstack

# Share dirstack between multiple zsh instances
function chpwd() {
    if is-at-least 4.1; then # dirs -p needs 4.1
        # Get the dirstack from the file and add it to the current dirstack
        dirstack=( ${(uf)"$(< $DIRSTACKFILE)"} )
        dirs -pl |sort -u >! ${DIRSTACKFILE}
    fi
}

rvm use ruby-1.8.7 > /dev/null

##https://github.com/defunkt/hub
function git(){hub "$@"}
