# Set the key mapping style to 'emacs' or 'vi'.
# zstyle ':omz:module:editor' keymap 'emacs'

# Auto convert .... to ../..
# zstyle ':omz:module:editor' dot-expansion 'yes'

# Set case-sensitivity for completion, history lookup, etc.
# zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
# zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
# zstyle ':omz:module:terminal' auto-title 'yes'

# Set the Zsh modules to load (man zshmodules).
# zstyle ':omz:load' zmodule 'attr' 'stat' 

# Set the Zsh functions to load (man zshcontrib).
# zstyle ':omz:load' zfunction 'zargs' 'zmv'

# Set the Oh My Zsh modules to load (browse modules).
# The order matters.
# zstyle ':omz:load' omodule \
#   'environment' \
#   'terminal' \
#   'editor' \
#   'command-not-found' \
#   'history' \
#   'directory' \
#   'spectrum' \
#   'utility' \
#   'completion' \
#   'git' \
#   'ssh-agent' \
#   'history-substring-search' \
#   'prompt'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
# zstyle ':omz:module:prompt' theme 'steeef'

#ssh-agent forwarding
# zstyle ':omz:module:ssh-agent' forwarding 'yes'

# load multiple identities
# zstyle ':omz:module:ssh-agent' identities 'dsidorenko' 'rustydragon'

# zstyle ':omz:module:tmux' auto-start 'yes'

# This will make you shout: OH MY ZSHELL!
#source "$OMZ/init.zsh"

# Customize to your needs...


if [ -x /usr/bin/dircolors ]; then
   test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
fi

# Load RVM into a shell session *as a function*
[[ -s "$rvm_path/scripts/rvm" ]] && source "$rvm_path/scripts/rvm"

# Local customization of zsh. .zsh_local should not be included in castle
if [ -f $HOME/.zsh_local ]; then
   source $HOME/.zsh_local
fi

if [ -f $HOME/.aliases ]; then
   source $HOME/.aliases
fi
