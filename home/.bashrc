# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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

PS1='\u @ $PRETTY_HOST_NAME \W $ '

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#Network home
if [ -d /u05/$(whoami) ]; then
    export NETWORK_HOME="/u05/$(whoami)"
fi

# Add RVM to PATH for scripting
# RVM installed in home dir take precedence
if [ -d $HOME/.rvm/bin ]; then
    export rvm_path=$HOME/.rvm
elif [ -d $NETWORK_HOME/.rvm/bin ]; then
    export rvm_path=$NETWORK_HOME/.rvm
fi

if [  "$rvm_path" != "" ]; then
    export PATH=$PATH:$rvm_path/bin

    # Load RVM into a shell session *as a function*
    [[ -s "$rvm_path/scripts/rvm" ]] && source "$rvm_path/scripts/rvm" 
fi

# Java settings
export MAVEN_OPTS="-Xms256m -Xmx1024m -XX:MaxPermSize=512m"

if [ -d /usr/lib/jvm/java-6-sun/ ]; then
    export JAVA_HOME=/usr/lib/jvm/java-6-sun/
fi

if [ -d /opt/gradle/current ]; then
    export GRADLE_HOME="/opt/gradle/current"
    PATH="$GRADLE_HOME/bin:$PATH"
fi

if [ -d /opt/maven/current/ ]; then
    export M2_HOME=/opt/maven/current/
fi


#Exit if IGNOREEOF EOF's sent
export IGNOREEOF=1

export PROMPT_COMMAND='history -a'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# # Local customization of bash. .bash_local should not be included in castle
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi


if [[ "$PRETTY_HOST_NAME" = "" ]]; then
    export PRETTY_HOST_NAME=$(hostname -s)
fi
