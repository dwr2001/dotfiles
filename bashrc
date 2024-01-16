# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth
HISTFILESIZE=8000
HISTIGNORE='&:cd*:clear:echo*:exit:history*:ls*'
HISTSIZE=2000
HISTTIMEFORMAT="%F %T "

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# if set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export PROMPT_COMMAND=bash_prompt

# git message on shell prompt, show git branch info
function git_prompt () {
    git branch 2> /dev/null \
        | sed -e '/^[^*]/d' \
        -e 's/* \(.*\)/\1/' \
        -e 's/HEAD detached at //'
}

# bash prompt
function bash_prompt() {
    local ex=$?
    
    local RED='\[\033[01;31m\]'
    local GREEN='\[\033[01;32m\]'
    local YELLOW='\[\033[01;33m\]'
    local BLUE='\[\033[01;34m\]'
    local CYAN='\[\033[01;36m\]'
    local RESET='\[\033[00m\]'

    local prompt="${GREEN}\u@\h${RESET}:${BLUE}\W${YELLOW} $(git_prompt)${RESET}\$ "

    if [ "${ex}" -eq 0 ]; then
        PS1="${prompt}"
    else
        PS1="${RED}${ex}${RESET}|${prompt}"
    fi
}

# alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
