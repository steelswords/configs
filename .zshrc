# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' prompt '%e Errors found, perhaps. Did you mean one of these?'
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/tristan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=5000
setopt autocd beep notify
bindkey -v

alias ll="ls -alFh --color=auto"
alias ls="ls --color=auto"
source ~/.profile

# End of lines configured by zsh-newuser-install

PROMPT="%n@%m:%d> "
