# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

# Java settings

export MAVEN_OPTS="-Xmx2048m -Xms1024m -XX:MaxPermSize=512m"
export JAVA_HOME="/opt/jdk/jdk1.6.0_31/"



export EDITOR=vim
export TERM=xterm


export IGNOREEOF=1

# Add to history, not replace
shopt -s histappend
export PROMPT_COMMAND='history -a'

# Ignore dups and simple commands in history
#export HISTCONTROL="ignoredups"
export HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE="&:ls:[bf]g:exit:ll:cd : *"

# Ignore Directory Name Typos
shopt -s cdspell

