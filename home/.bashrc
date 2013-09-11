# ~/.bashrc: executed by bash(1) for non-login shells.

if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=1000000000
HISTSIZE=1000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#Show that many dir components in \w
export PROMPT_DIRTRIM=2
export PS1='\u@\[$(tput setaf 4)\]$PRETTY_HOST_NAME \[$(tput setaf 2)\][\w] \[$(tput bold)\]\\$\[$(tput sgr0)\] '

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#Exit if IGNOREEOF EOF's sent
export IGNOREEOF=1

#Save history
export PROMPT_COMMAND='history -a'

# # Local customization of bash. .bash_local should not be included in castle
if [ -f $HOME/.bash_local ]; then
    source $HOME/.bash_local
fi

# Alias definitions.
if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi

# Alias definitions.
if [ -f $HOME/.env ]; then
    source $HOME/.env
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/home/dsidorenko/.gvm/bin/gvm-init.sh" ]] && source "/home/dsidorenko/.gvm/bin/gvm-init.sh"
