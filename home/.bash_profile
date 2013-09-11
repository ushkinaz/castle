# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
    fi
fi

export EDITOR=vim
export TERM=xterm-color

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/home/dsidorenko/.gvm/bin/gvm-init.sh" ]] && source "/home/dsidorenko/.gvm/bin/gvm-init.sh"
