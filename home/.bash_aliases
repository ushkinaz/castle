# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    
    LS_COLOR=' --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Listings
alias ll='ls -alF'$LS_COLOR
alias la='ls -A'$LS_COLOR
alias ls='ls -CF'$LS_COLOR

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters


if [ -d ~/Workspace/agent ]; then
    alias cda='cd ~/Workspace/agent/'
fi

if [ -d ~/Workspace/agent/app.aggregator ]; then
    alias cdag='cd ~/Workspace/agent/app.aggregator'
fi

if [ -d ~/logs/aslogs/ ]; then
	alias cdl='cd ~/logs/aslogs/'
fi

#Maven, quick and durty rebuild
if [ -x $M2_HOME/bin/mvn ]; then
alias smoke='mvn --fail-at-end -B -T 2.0C -DskipTests clean compile'	
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
if [ -x /usr/bin/notify-send ]; then
	alias alert='notify-send --urgency=low -t 1000 -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi
