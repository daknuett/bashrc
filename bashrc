# .bashrc


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


source ~/.bash/fixedwith.sh
PROMPT_COMMAND='make_prompt'
make_prompt () {
    local lastexit=$?
    PS1="\n\[\033[1;32m\]┌[\[\033[00m\] "$(~/.bash/battery.bash 12)" \[\033[1;32m\]|\[\033[00m\] $(fixed_width "$(~/.bash/git.bash)" 12) \[\033[1;32m\]|\[\033[00m\] $( fixed_width "$($EDITOR --version | head -1)" 12) \[\033[1;32m\]|\[\033[00m\] $(fixed_width "$lastexit" 6) \[\033[1;32m\]|\[\033[00m\] $(fixed_width "$(free -h | head -2 | tail -1 | cut -c 15-22)" 10) \[\033[1;32m\]]\[\033[00m\]"
    PS1+="\n\[\033[1;32m\]╞[\[\033[00m\] \[\033[01;36m\]$( fixed_width $HOSTNAME 12) \[\033[1;32m\]|\[\033[00m\]\033[01;31m\] $(fixed_width "$USER" 12) \[\033[1;32m\]|\[\033[00m\] $( fixed_width "$(uname -m)" 12) \[\033[1;32m\]|\[\033[00m\] $(fixed_width "$(jobs | wc -l)" 6) \[\033[1;32m\]|\[\033[00m\] $(fixed_width "$(free -h | head -2 | tail -1 | cut -c 26-33)" 10) \[\033[1;32m\]]\[\033[00m\]"
    PS1+="\n\[\033[1;32m\]╞> \[\033[01;33m\]\w\[\033[00m\]"
    PS1+="\n\[\033[1;32m\]└\[\033[00m\] \[\033[01;35m\]\$ \[\033[00m\]"
}


alias lab="jupyter-lab"
