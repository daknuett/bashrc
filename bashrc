# .bashrc


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


source $HOME/.bash/virtualenvwrapper.sh


alias notebook="python3 -m notebook"

alias vim="$HOME/.local/bin/nvim.appimage"
set -o vi

nvim="$HOME/.local/bin/nvim.appimage"
if [[ $(uname -m) == "aarch64" ]]
then 
    nvim="$HOME/.local/bin/nvim-aarch64.appimage"
fi

export VISUAL="$nvim"
export EDITOR="$nvim"

alias ed="$EDITOR"
alias :e="$EDITOR"

export PATH=$PATH:$HOME/.bin/
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/.cargo/bin

#   export PS1="\[\e]0;\u@\h: \w\a\]\[\033[01;31m\]\u\[\033[01;33m\]@\[\033[01;36m\]\h \[\033[01;33m\]\w \[\033[01;35m\]\$ \[\033[00m\]"


source ~/.bash/fixedwith.sh
PROMPT_COMMAND='make_prompt'
make_prompt () {
    local lastexit=$?
    if ! command -v make_prompt_rs &> /dev/null
    then
        PS1="\n\[\033[1;32m\]┌[\[\033[00m\] "$(~/.bash/battery.bash 12)" \[\033[1;32m\]|\[\033[00m\] $(fixed_width "$(~/.bash/git.bash)" 12) \[\033[1;32m\]|\[\033[00m\] $( fixed_width "$($EDITOR --version | head -1 | cut -d "-" -f 1)" 12) \[\033[1;32m\]|\[\033[00m\] $(fixed_width "$lastexit" 6) \[\033[1;32m\]|\[\033[00m\] $(fixed_width "$(free -h | head -2 | tail -1 | cut -c 15-22)" 10) \[\033[1;32m\]]┐\[\033[00m\]"
        PS1+="\n\[\033[1;32m\]╞[\[\033[00m\] \[\033[01;36m\]$( fixed_width $HOSTNAME 12) \[\033[1;32m\]|\[\033[00m\]\033[01;31m\] $(fixed_width "$USER" 12) \[\033[1;32m\]|\[\033[00m\] $( fixed_width "$(uname -m)" 12) \[\033[1;32m\]|\[\033[00m\] $(fixed_width "$(jobs | wc -l)" 6) \[\033[1;32m\]|\[\033[00m\] $(fixed_width "$(free -h | head -2 | tail -1 | cut -c 26-33)" 10) \[\033[1;32m\]]┘\[\033[00m\]"
        PS1+="\n\[\033[1;32m\]╞> \[\033[01;33m\]\w\[\033[00m\]"
        PS1+="\n\[\033[1;32m\]└\[\033[00m\] \[\033[01;35m\]\$ \[\033[00m\]"
    else 
        local bgjobs=$(jobs | wc -l)
        local prompt_pref=$(make_prompt_rs $lastexit $bgjobs) 
        PS1="$prompt_pref"
    fi
}


alias lab="jupyter-lab"

export HISTSIZE=10000
export HISTFILESIZE=10000
