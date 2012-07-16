alias cda='cd ~/Workspace/agent/'
alias cdag='cd ~/Workspace/agent/app.aggregator'
alias cdl='cd ~/logs/aslogs/'

alias ls='ls -CF'
alias ll='ls -lF'
alias pu='pushd'
alias po='popd'
alias l=ls

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
#alias grep='grep --color'                     # show differences in colour

alias smoke='mvn --fail-at-end -B -DskipTests clean compile -T 2.0C'

