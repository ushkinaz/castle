#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Set the path to Oh My Zsh.
export OMZ="$HOME/.oh-my-zsh"

# Paths
typeset -gU cdpath fpath mailpath manpath path
typeset -gUT INFOPATH infopath

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that info searches for manuals.
infopath=(
  /usr/local/share/info
  /usr/share/info
  $infopath
)

# Set the list of directories that man searches for manuals.
manpath=(
  /usr/local/share/man
  /usr/share/man
  $manpath
)

for path_file in /etc/manpaths.d/*(.N); do
  manpath+=($(<$path_file))
done
unset path_file

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)

for path_file in /etc/paths.d/*(.N); do
  path+=($(<$path_file))
done
unset path_file

# Language
if [[ -z "$LANG" ]]; then
  eval "$(locale)"
fi

# Editors
export EDITOR='vim'
export VISUAL='vim'

if [ -x most ]; then
    export PAGER='most'
else
    export PAGER='less'
fi

# Browser (Default)
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Less

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
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

if [[ "$PRETTY_HOST_NAME" = "" ]]; then
    export PRETTY_HOST_NAME=$(hostname -s)
fi
