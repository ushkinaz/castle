# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Listings
alias ll='ls -alF'
alias la='ls -A'
alias ls='ls -CF'

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias grep='grep --color'                     # show differences in colour


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
alias smoke='mvn --fail-at-end -B -T 2.0C -DskipTests clean compile'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -t 1000 -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
