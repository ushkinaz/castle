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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


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
    rvm_path=$HOME/.rvm
elif [ -d $NETWORK_HOME/.rvm/bin ]; then
    rvm_path=$NETWORK_HOME/.rvm
fi
export rvm_path
PATH=$PATH:$rvm_path/bin

# Load RVM into a shell session *as a function*
[[ -s "$rvm_path/.rvm/scripts/rvm" ]] && source "$rvm_path/scripts/rvm" 


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
