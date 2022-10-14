# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi



alias notebook="python3 -m notebook"

alias vim="$HOME/.local/bin/nvim.appimage"
set -o vi

export VISUAL="$HOME/.local/bin/nvim.appimage"
export EDITOR="$HOME/.local/bin/nvim.appimage"

alias ed="$EDITOR"
alias :e="$EDITOR"

export PATH=$PATH:$HOME/.bin/
export PATH=$PATH:$HOME/.local/bin/

#   export PS1="\[\e]0;\u@\h: \w\a\]\[\033[01;31m\]\u\[\033[01;33m\]@\[\033[01;36m\]\h \[\033[01;33m\]\w \[\033[01;35m\]\$ \[\033[00m\]"

PROMPT_COMMAND='make_prompt'
make_prompt () {
    PS1="\n\[\033[1;32m\]┌[\[\033[00m\] $(~/.bash/battery.bash) \[\033[1;32m\]|\[\033[00m\] $(~/.bash/git.bash) \[\033[1;32m\]|\[\033[00m\] $($EDITOR --version | head -1) \[\033[1;32m\]|\[\033[00m\] \# \[\033[1;32m\]]\[\033[00m\]"
   PS1+="\n\[\033[1;32m\]╞[\[\033[00m\] \[\033[01;36m\]\h \[\033[1;32m\]|\[\033[00m\] \033[01;31m\]\u \[\033[1;32m\]|\[\033[00m\] \[\033[01;33m\]\w \[\033[1;32m\]]\[\033[00m\]"
   PS1+="\n\[\033[1;32m\]└\[\033[00m\] \[\033[01;35m\]\$ \[\033[00m\]"
}


alias lab="jupyter-lab"
